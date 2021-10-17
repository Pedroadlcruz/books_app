import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/input_decorations.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/core/widgets/app_btn.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  static const String routeName = 'change_password_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 47.dH),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.dW),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 40.dW,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(
                    height: 50.dH,
                    width: 40.dW,
                  ),
                ],
              ),
            ),
            Text(Strings.changePassword, style: TextStyles.mainLabel),
            SizedBox(height: 88.dH),
            const _ChangePasswordForm(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
  }
}

class _ChangePasswordForm extends StatelessWidget {
  const _ChangePasswordForm({
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
              // obscureText: loginBloc.obscureText,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.newPassword,
                labelText: Strings.newPassword,
                // suffix: InkWell(
                //   onTap: () => loginBloc.toggleVisibility(),
                //   child: Icon(loginBloc.obscureText
                //       ? Icons.visibility
                //       : Icons.visibility_off),
                // ),
              ),
              // onChanged: (value) => loginBloc.password = value,
              // validator: (password) => password!.isPasswordValid,
            ),
            SizedBox(height: 22.dH),
            TextFormField(
              // obscureText: loginBloc.obscureText,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.confirmPassword,
                labelText: Strings.confirmPassword,
                // suffix: InkWell(
                //   onTap: () => loginBloc.toggleVisibility(),
                //   child: Icon(loginBloc.obscureText
                //       ? Icons.visibility
                //       : Icons.visibility_off),
                // ),
              ),
              // onChanged: (value) => loginBloc.password = value,
              // validator: (password) => password!.isPasswordValid,
            ),
            SizedBox(height: 22.dH),
            AppBtn(
              label: Strings.changePassword,
              onPressed: () {},
            ),
            SizedBox(height: 70.dH),
          ],
        ),
      ),
    );
  }
}
