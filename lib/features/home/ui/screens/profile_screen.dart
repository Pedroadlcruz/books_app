import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/utils/alerts.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/core/widgets/app_btn.dart';
import 'package:take_home_project/features/auth/bloc/auth_bloc.dart';
import 'package:take_home_project/features/auth/ui/screens/change_password.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 62.dH, width: double.infinity),
          Text(
            Strings.profile,
            style: TextStyles.mainLabel.copyWith(fontSize: 20.fS),
          ),
          SizedBox(height: 49.dH),
          Container(
            height: 158.dW,
            width: 158.dW,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(158.dW)),
              child: Image.network(
                'https://cdn.pngsumo.com/sunglasses-png-source-smiley-face-emoji-transparent-png-emoji-smiley-face-png-920_705.png',
                height: 158.dW,
                width: 158.dW,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30.dH),
          Text('Adam', style: TextStyles.mainLabel.copyWith(fontSize: 24.fS)),
          SizedBox(height: 90.dH),
          AppBtn(
            label: Strings.changePassword,
            onPressed: () =>
                Navigator.pushNamed(context, ChangePasswordScreen.routeName),
          ),
          SizedBox(height: 18.dH),
          AppBtn(
            label: Strings.logout,
            onPressed: () => Alerts.confirmDialog(
              context: context,
              title: Strings.logoutConfirmationMsg,
              onYes: () => context.read<AuthBloc>().logOut(),
            ),
          ),
          SizedBox(height: 18.dH),
          AppBtn(
            label: Strings.deleteAccount,
            onPressed: () => Alerts.confirmDialog(
              context: context,
              title: Strings.deleteAccountConfirmationMsg,
              onYes: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
  }
}
