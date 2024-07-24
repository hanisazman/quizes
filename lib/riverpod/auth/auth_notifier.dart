import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/exports.dart';

import '../../models/quiz_model.dart';
import '../../models/user_model.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final logger = Logger();
  final HiveService hiveService = HiveService();

  final Box<UserModel> _userBox;

  AuthNotifier()
      : _userBox = Hive.box<UserModel>('userBox'),
        super(const AuthState());

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  setUsernames() async {
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString('username') ?? '';
    final name = prefs.getString('name') ?? '';

    state = state.copyWith(
      isLoading: false,
      isLoginError: false,
      isLoggedIn: true,
      username: username,
      name: name,
    );
  }

  void signup({
    required String username,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    VoidCallback? goToLogin,
  }) async {
    state = state.copyWith(isLoading: true);
    bool isEmailError = !AppValidators.isValidEmail(email);
    bool isPasswordError = !AppValidators.isValidPassword(password);
    bool isConfirmPasswordError =
        !AppValidators.arePasswordsTheSame(password, confirmPassword);

    if (isEmailError || isPasswordError || isConfirmPasswordError) {
      state = state.copyWith(
        isLoading: false,
        emailError: isEmailError ? 'Invalid email address' : '',
        passwordError:
            isPasswordError ? 'Password must be at least 8 characters' : '',
        confirmPasswordError:
            isConfirmPasswordError ? 'Passwords do not match' : '',
      );
    } else {
      if (_userBox.values.any((user) => user.username == username)) {
        state = state.copyWith(
          isLoading: false,
          isSignupError: true,
          signupError: 'Username already exists',
        );
        return;
      } else {
        final newUserId =
            (_userBox.length + 1).toString(); // Generate incremental ID
        final newUser = UserModel(
          id: newUserId,
          username: username,
          password: password,
          name: name,
          email: email,
        );
        state = state.copyWith(
          isLoading: false,
          isSignupError: false,
        );

        await _userBox.put(newUserId, newUser);
        goToLogin?.call();
      }
    }
  }

  Future<void> login({
    required String username,
    required String password,
    VoidCallback? goToMain,
  }) async {
    state = state.copyWith(isLoading: true);

    final user =
        _userBox.values.firstWhere((user) => user.username == username);

    if (user.password != password) {
      state = state.copyWith(
        isLoading: false,
        isLoginError: true,
        loginError: 'Invalid username or password',
      );
      return;
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', user.username);
      await prefs.setString('name', user.name);
      await prefs.setString('email', user.email);
      await prefs.setBool('isLoggedIn', true);

      final username = prefs.getString('username') ?? '';
      final name = prefs.getString('name') ?? '';

      state = state.copyWith(
        isLoading: false,
        isLoginError: false,
        isLoggedIn: true,
        username: username,
        name: name,
      );
      goToMain?.call();
    }
  }

  logout({VoidCallback? goToLogin}) async {
    // Navigate to login screen
    goToLogin?.call();

    // clear SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Clear Hive boxes
    await _clearHiveBoxes();

    // Delete cache and application directories
    await _deleteCacheDir();
    await _deleteAppDir();
    state = const AuthState();
  }

  Future<void> _clearHiveBoxes() async {
    if (!mounted) {
      // Widget is disposed, do not proceed with further actions
      return;
    }
    final hiveService = HiveService();

    await hiveService.clearBox(box: Hive.box<QuizModel>('quizBox'));
    // await hiveService.clearBox(box: Hive.box<CategoryModel>('categoryBox'));
    // await hiveService.clearBox(box: Hive.box<ItemModel>('itemBox'));
  }

  Future<void> _deleteCacheDir() async {
    try {
      final cacheDir = await getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        for (var file in cacheDir.listSync()) {
          try {
            if (file is File) {
              file.deleteSync();
            } else if (file is Directory) {
              file.deleteSync(recursive: true);
            }
          } catch (e) {
            logger.e('Failed to delete ${file.path}: $e');
          }
        }
      }
    } catch (e) {
      logger.e('Error while deleting cache directory: $e');
    }
  }

  Future<void> _deleteAppDir() async {
    try {
      final appDir = await getApplicationSupportDirectory();
      if (appDir.existsSync()) {
        for (var file in appDir.listSync()) {
          try {
            if (file is File) {
              file.deleteSync();
            } else if (file is Directory) {
              file.deleteSync(recursive: true);
            }
          } catch (e) {
            logger.e('Failed to delete ${file.path}: $e');
          }
        }
      }
    } catch (e) {
      logger.e('Error while deleting application directory: $e');
    }
  }

  // Future<void> _deleteCacheDir() async {
  //   final cacheDir = await getTemporaryDirectory();
  //   if (cacheDir.existsSync()) {
  //     // cacheDir.deleteSync(recursive: true);
  //     for (var file in cacheDir.listSync()) {
  //       try {
  //         if (file is File) {
  //           file.deleteSync();
  //         } else if (file is Directory) {
  //           file.deleteSync(recursive: true);
  //         }
  //       } catch (e) {
  //         print('Failed to delete ${file.path}: $e');
  //       }
  //     }
  //   }
  // }

  // Future<void> _deleteAppDir() async {
  //   final appDir = await getApplicationSupportDirectory();
  //   if (appDir.existsSync()) {
  //     appDir.deleteSync(recursive: true);
  //   }
  // }
}
