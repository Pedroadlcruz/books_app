import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/features/auth/bloc/auth_bloc.dart';
import 'package:take_home_project/features/auth/models/user.dart';
import 'package:take_home_project/features/auth/ui/screens/screens.dart';
import 'package:take_home_project/features/home/ui/screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<User>();
    if (appUser.isEmpty) {
      return const HomeScreen();
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Screem'),
          SizedBox(
            height: 100,
            width: double.infinity,
          ),
          TextButton(
              onPressed: () => context.read<AuthBloc>().logOut(),
              child: Text('Cerrar Sesion'))
        ],
      ),
    );
  }
}
