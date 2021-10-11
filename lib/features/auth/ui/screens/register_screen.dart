import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = 'register_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(routeName)),
    );
  }
}
