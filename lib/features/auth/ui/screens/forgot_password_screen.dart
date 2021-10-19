import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/extensions/validators.dart';
import 'package:take_home_project/core/theme/input_decorations.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/core/utils/alerts.dart';
import 'package:take_home_project/core/widgets/app_btn.dart';
import 'package:take_home_project/features/auth/bloc/forgot_password_bloc.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

import 'login_screen.dart';

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
            ChangeNotifierProvider(
                create: (_) =>
                    ForgotPasswordBloc(authRepository: AuthRepositoryImpl()),
                child: const _ForgotPasswordForm()),
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
    // Forgot Password Bloc instance
    final forgotPassBloc = context.watch<ForgotPasswordBloc>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.dW),
      child: Form(
        key: forgotPassBloc.formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.hintEmail,
                labelText: Strings.email,
              ),
              onChanged: (value) => forgotPassBloc.email = value,
              validator: (email) => email!.isEmailValid,
            ),
            SizedBox(height: 22.dH),
            AppBtn(
              label: Strings.sendBtn,
              onPressed: forgotPassBloc.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!forgotPassBloc.isValidForm()) return;
                      final result = await context
                          .read<ForgotPasswordBloc>()
                          .onForgotPasswordRequest();
                      if (result) {
                        Alerts.alertDialog(
                          context: context,
                          content: Strings.forgotPasswordSuccessMsg,
                          onOk: () => Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName),
                        );
                      } else {
                        Alerts.alertDialog(
                          context: context,
                          isSucccess: false,
                          content: forgotPassBloc.errorMsg,
                          onOk: () => Navigator.pop(context),
                        );
                      }
                    },
            ),
            SizedBox(height: 70.dH),
          ],
        ),
      ),
    );
  }
}
