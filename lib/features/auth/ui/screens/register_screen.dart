import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/extensions/validators.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/utils/app_functions.dart';
import 'package:take_home_project/core/utils/input_decorations.dart';
import 'package:take_home_project/core/utils/text_styles.dart';
import 'package:take_home_project/features/auth/bloc/signup_bloc.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';
import 'package:take_home_project/features/auth/ui/screens/screens.dart';
import 'package:take_home_project/features/auth/ui/widgets/user_terms.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = 'register_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 113.dH),
            Text(Strings.signUp, style: TextStyles.mainLabel),
            SizedBox(height: 21.dH),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 90.dW),
              child: Text(
                Strings.signUpMsj,
                style: TextStyles.text,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 38.dH),
            ChangeNotifierProvider(
              create: (_) => SignUpBloc(authRepository: AuthRepositoryImpl()),
              child: const _SignUpForm(),
            ),
            // SizedBox(height: 19.dH),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.routeName, (route) => false);
              },
              child: RichText(
                text: TextSpan(
                  text: Strings.alreadyhaveAnAccount,
                  children: [
                    TextSpan(
                      text: Strings.login,
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

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.watch<SignUpBloc>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.dW),
      child: Form(
        key: signUpBloc.formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.hintFullName,
                labelText: Strings.fullName,
              ),
              onChanged: (value) => signUpBloc.name = value,
              validator: (name) => name!.isNameValid,
            ),
            SizedBox(height: 19.dH),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.hintEmail,
                labelText: Strings.email,
              ),
              onChanged: (value) => signUpBloc.email = value,
              validator: (email) => email!.isEmailValid,
            ),
            SizedBox(height: 19.dH),
            TextFormField(
              obscureText: signUpBloc.obscureText,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: Strings.password,
                labelText: Strings.password,
                suffix: InkWell(
                  onTap: () => signUpBloc.toggleVisibility(),
                  child: Icon(signUpBloc.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              onChanged: (value) => signUpBloc.password = value,
              validator: (password) => password!.isPasswordValid,
            ),
            SizedBox(height: 19.dH),
            UserTerms(),
            SizedBox(height: 38.dH),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(310.0, 53.0),
              ),
              child: const Text(
                Strings.signUp,
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: signUpBloc.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!signUpBloc.isValidForm()) return;
                      final success =
                          await context.read<SignUpBloc>().onSignUpRequest();
                      if (!success) {
                        buildScaffoldMessenger(
                            context: context, text: signUpBloc.errorMsg);
                      }
                    },
            ),
            SizedBox(height: 70.dH),
            OutlinedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.google,
                  color: AppColors.primaryColor),
              label: Text(
                Strings.signUpWithGoogle,
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
