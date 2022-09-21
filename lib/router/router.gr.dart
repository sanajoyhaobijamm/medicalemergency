// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../google.dart' as _i1;
import '../logic.dart' as _i2;
import '../util/startup.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SignInScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SignInScreen());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage());
    },
    StartupRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StartupPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/signin', fullMatch: true),
        _i4.RouteConfig(SignInScreen.name, path: '/signin'),
        _i4.RouteConfig(LoginRoute.name, path: '/login'),
        _i4.RouteConfig(StartupRoute.name, path: '/startup')
      ];
}

/// generated route for
/// [_i1.SignInScreen]
class SignInScreen extends _i4.PageRouteInfo<void> {
  const SignInScreen() : super(SignInScreen.name, path: '/signin');

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.StartupPage]
class StartupRoute extends _i4.PageRouteInfo<void> {
  const StartupRoute() : super(StartupRoute.name, path: '/startup');

  static const String name = 'StartupRoute';
}
