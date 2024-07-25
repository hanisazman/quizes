import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive
  await HiveBox.init();

  // all the repositories
  setUpDependencies();

  await LocalStorage.getInstance();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        builder: (context, child) {
      return MaterialApp.router(
        color: AppColors.primaryColor,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        builder: (context, child) => ScrollConfiguration(
          behavior: MyBehavior(),
          child: child ?? const SizedBox.shrink(),
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
