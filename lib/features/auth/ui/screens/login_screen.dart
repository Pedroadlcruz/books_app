import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/utils/input_decorations.dart';
import 'package:take_home_project/core/utils/text_styles.dart';
import 'package:take_home_project/features/auth/bloc/login_bloc.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';
import 'package:take_home_project/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:take_home_project/features/auth/ui/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 113.dH),
            Text(Strings.login, style: TextStyles.mainLabel),
            SizedBox(height: 21.dH),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 90.dW),
              child: Text(
                Strings.loginMsj,
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 38.dH),
            ChangeNotifierProvider(
              create: (_) => LoginBloc(authRepository: AuthRepositoryImpl()),
              child: const _LoginForm(),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RegisterScreen.routeName, (route) => false);
              },
              child: RichText(
                text: TextSpan(
                  text: Strings.dontHaveAnAccount,
                  children: [
                    TextSpan(
                      text: Strings.signUp,
                      style: TextStyles.blueText.copyWith(fontSize: 16.fS),
                    ),
                  ],
                  style: TextStyles.text.copyWith(fontSize: 16.fS),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.dW),
      child: Form(
        key: loginBloc.formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.hintEmail,
                labelText: Strings.email,
              ),
              onChanged: (value) => loginBloc.email = value,
              validator: (value) {},
            ),
            SizedBox(height: 22.dH),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.password,
                labelText: Strings.password,
              ),
              onChanged: (value) => loginBloc.password = value,
              validator: (value) {},
            ),
            SizedBox(height: 49.dH),
            InkWell(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(Strings.forgotPasswordBtn, style: TextStyles.text)),
            SizedBox(height: 38.dH),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(310.0, 53.0),
              ),
              child: const Text(
                Strings.login,
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () => context.read<LoginBloc>().onLoginRequest(),
            ),
            SizedBox(height: 70.dH),
            OutlinedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.google,
                  color: AppColors.primaryColor),
              label: Text(
                Strings.loginWithGoogle,
                style: TextStyles.blueText,
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(310.0, 53.0),
                primary: Colors.white,
                side: const BorderSide(color: AppColors.primaryColor),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 19.dH),
          ],
        ),
      ),
    );
  }
}
