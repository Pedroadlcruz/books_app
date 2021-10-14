import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:take_home_project/features/auth/ui/screens/screens.dart';
import 'package:take_home_project/features/auth/ui/widgets/auth_wrapper.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPage(AuthWrapper());
      case LoginScreen.routeName:
        return _buildPage(LoginScreen());
      case RegisterScreen.routeName:
        return _buildPage(RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return _buildPage(ForgotPasswordScreen());

      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Route<dynamic> _buildPage(Widget page,
      {String? routeName, Object? arguments}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (_) => page,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    } else {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    }
  }

  void dispose() {}
}
