import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword,
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoginError,
    @Default(false) bool isSignupError,
    @Default(false) bool isEmailError,
    @Default(false) bool isPasswordError,
    @Default(false) bool isConfirmPasswordError,
    @Default('') String emailError,
    @Default('') String passwordError,
    @Default('') String confirmPasswordError,
    @Default('') String signupError,
    @Default('') String loginError,
    @Default('') String username,
    @Default('') String password,
    @Default('') String name,
  }) = _AuthState;

  const AuthState._();
}