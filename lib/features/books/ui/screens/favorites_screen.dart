import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const String routeName = 'favorites_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favorites Screen'),
      ),
      bottomNavigationBar: BottomTabSelector(),
    );
  }
}
