import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/utils/input_decorations.dart';
import 'package:take_home_project/core/utils/text_styles.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = 'forgot_password_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 113.dH),
            Text(Strings.forgotPassword, style: TextStyles.mainLabel),
            SizedBox(height: 21.dH),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 65.dW),
              child: Text(
                Strings.forgotPasswordMsj,
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 38.dH),
            const _ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordForm extends StatelessWidget {
  const _ForgotPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.dW),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.hintEmail,
                labelText: Strings.email,
              ),
              onChanged: (value) => {},
              validator: (value) {},
            ),
            SizedBox(height: 22.dH),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(330.0, 53.0),
              ),
              child: const Text(
                Strings.sendBtn,
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 70.dH),
          ],
        ),
      ),
    );
  }
}
