import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile Screen'),
      ),
      bottomNavigationBar: BottomTabSelector(),
    );
  }
}
