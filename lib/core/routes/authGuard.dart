// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart' show AutoRouteGuard, NavigationResolver, StackRouter;

import '../exports.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final bool isLoggedIn = LocalStorage.instance.getIsLoggedIn();
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (isLoggedIn) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(const LoginRoute());
    }
  }
}
