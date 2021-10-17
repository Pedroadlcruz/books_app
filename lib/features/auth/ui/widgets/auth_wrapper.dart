import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/features/auth/bloc/auth_bloc.dart';
import 'package:take_home_project/features/auth/ui/screens/screens.dart';
import 'package:take_home_project/features/home/ui/screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final appUser = context.select((AuthBloc user) => user.currentUser);
    if (appUser.isEmpty) {
      return const LoginScreen();
    }
    return const HomeScreen();
  }
}
