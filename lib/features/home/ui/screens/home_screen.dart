import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: BottomTabSelector(),
    );
  }
}
