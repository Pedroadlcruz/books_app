import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(routeName)),
    );
  }
}
