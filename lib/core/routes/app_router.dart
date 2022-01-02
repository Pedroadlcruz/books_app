import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:take_home_project/features/auth/ui/screens/screens.dart';
import 'package:take_home_project/features/auth/ui/widgets/auth_wrapper.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/ui/screens/book_detail_screen.dart';
import 'package:take_home_project/features/books/ui/screens/books_screen.dart';
import 'package:take_home_project/features/books/ui/screens/favorites_screen.dart';
import 'package:take_home_project/features/home/ui/screens/home_screen.dart';
import 'package:take_home_project/features/home/ui/screens/profile_screen.dart';

class AppRouter {
  ///
  /// Given a [route name]...
  ///Build a route base on the current Platform [IOS] and [Android]
  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPage(const AuthWrapper());
      case LoginScreen.routeName:
        return _buildPage(const LoginScreen());
      case RegisterScreen.routeName:
        return _buildPage(const RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return _buildPage(const ForgotPasswordScreen());
      case HomeScreen.routeName:
        return _buildTabPage(const HomeScreen());
      case BooksScreen.routeName:
        return _buildTabPage(const BooksScreen());
      case FavoritesScreen.routeName:
        return _buildTabPage(const FavoritesScreen());
      case ProfileScreen.routeName:
        return _buildTabPage(const ProfileScreen());
      case BookDetailScreen.routeName:
        return _buildPage(BookDetailScreen(book: settings.arguments! as Book));

      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

//Build a route base on the current Platform [IOS] and [Android]
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

// build a specific route for the screens that the tab page contains
  static Route<dynamic> _buildTabPage(Widget page,
      {String? routeName, Object? arguments}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      settings: RouteSettings(name: routeName, arguments: arguments),
    );
  }
}
