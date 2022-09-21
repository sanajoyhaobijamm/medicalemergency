import 'package:auto_route/auto_route.dart';
import '../google.dart';
import '../logic.dart';
import '../util/startup.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInScreen, initial: true, path: '/signin'),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: StartupPage, path: '/startup'),
  ],
)
class $AppRouter {}
