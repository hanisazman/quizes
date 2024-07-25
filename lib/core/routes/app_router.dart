import 'package:auto_route/auto_route.dart';

import '../../ui/pages/auth/login_page.dart';
import '../../ui/pages/auth/signup_page.dart';
import '../../ui/pages/main/main_page.dart';
import 'authGuard.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        RedirectRoute(path: '/', redirectTo: '/main'),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/signup', page: SignUpRoute.page),
        AutoRoute(
            path: '/main',
            page: MainRoute.page,
            initial: true,
            guards: [AuthGuard()]),
      ];
}
