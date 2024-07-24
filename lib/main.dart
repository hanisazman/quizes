// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/exports.dart';
import 'ui/pages/auth/login_page.dart';
import 'ui/pages/auth/signup_page.dart';
import 'ui/pages/main/main_page.dart';
import 'ui/pages/quiz/question_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive
  await HiveBox.init();
  final prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool('isLoggedIn');

  // all the repositories
  setUpDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
  runApp(ProviderScope(child: MyApp(isLoggedIn: isLoggedIn ?? false)));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        // designSize: const Size(1194, 900),
        builder: (context, child) {
      return MaterialApp(
        color: AppColors.primaryColor,
        initialRoute: isLoggedIn ? Routes.main : Routes.login,
        routes: {
          Routes.login: (context) => const LoginPage(),
          Routes.signup: (context) => const SignUpPage(),
          Routes.main: (context) => const MainPage(),
          Routes.question: (context) => const QuestionPage(),
        },
        builder: (context, child) => ScrollConfiguration(
          behavior: MyBehavior(),
          child: child ?? const SizedBox.shrink(),
          // child: QuizPage(),
        ),
      );
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String main = '/main';
  static const String question = '/question';
}
