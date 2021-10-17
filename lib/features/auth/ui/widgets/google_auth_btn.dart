import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/core/utils/alerts.dart';
import 'package:take_home_project/features/auth/bloc/login_bloc.dart';
import 'package:take_home_project/features/home/ui/screens/home_screen.dart';

class GoogleAuthBtn extends StatelessWidget {
  const GoogleAuthBtn({
    Key? key,
    required this.loginBloc,
    required this.label,
  }) : super(key: key);

  final LoginBloc loginBloc;
  final String label;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon:
          const FaIcon(FontAwesomeIcons.google, color: AppColors.primaryColor),
      label: Text(
        label,
        style: TextStyles.blueText,
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(310.0, 53.0),
        primary: Colors.white,
        side: const BorderSide(color: AppColors.primaryColor),
      ),
      onPressed: loginBloc.isLoading
          ? null
          : () async {
              FocusScope.of(context).unfocus();

              final success =
                  await context.read<LoginBloc>().onLoginWithGoogle();
              if (success) {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              } else {
                Alerts.buildScaffoldMessenger(
                    context: context, text: loginBloc.errorMsg);
              }
            },
    );
  }
}
