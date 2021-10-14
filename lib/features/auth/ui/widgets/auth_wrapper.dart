import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/features/auth/models/user.dart';
import 'package:take_home_project/features/auth/ui/screens/screens.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<User>();
    if (appUser.isEmpty) {
      return const LoginScreen();
    }
    return const Scaffold(
      body: Center(
        child: Text('Home Screem'),
      ),
    );
  }
}
