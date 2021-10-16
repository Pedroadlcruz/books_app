import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/features/home/bloc/tab_bloc.dart';

import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/features/home/models/app_bottom_tab.dart';
import 'package:take_home_project/features/home/ui/screens/books_screen.dart';
import 'package:take_home_project/features/home/ui/screens/favorites_screen.dart';
import 'package:take_home_project/features/home/ui/screens/home_screen.dart';
import 'package:take_home_project/features/home/ui/screens/profile_screen.dart';

class BottomTabSelector extends StatelessWidget {
  const BottomTabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.select((TabBloc tab) => tab.currentTab.index),
        onTap: (index) => _onTapItem(AppBottomTab.values[index], context),
        items: AppBottomTab.values
            .map((tab) => _getBarItem(tab, context))
            .toList());
  }

  void _onTapItem(AppBottomTab activeTab, BuildContext context) {
    context.read<TabBloc>().onUpdateTab(activeTab);
    switch (activeTab) {
      case AppBottomTab.books:
        return _pushNamedRoute(context, BooksScreen.routeName);
      case AppBottomTab.favorites:
        return _pushNamedRoute(context, FavoritesScreen.routeName);

      case AppBottomTab.profile:
        return _pushNamedRoute(context, ProfileScreen.routeName);

      case AppBottomTab.home:
        return _pushNamedRoute(context, HomeScreen.routeName);
      default:
        _pushNamedRoute(context, HomeScreen.routeName);

        break;
    }
  }

  void _pushNamedRoute(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  BottomNavigationBarItem _getBarItem(AppBottomTab tab, BuildContext context) {
    String? title;
    Icon? icon;
    final double iconSize = 6.w;
    if (tab == AppBottomTab.home) {
      icon = Icon(Icons.home, size: iconSize);
      title = Strings.home;
    } else if (tab == AppBottomTab.books) {
      icon = Icon(FontAwesomeIcons.book, size: iconSize);
      title = Strings.books;
    } else if (tab == AppBottomTab.favorites) {
      icon = Icon(CupertinoIcons.heart_fill, size: iconSize);
      title = Strings.favorites;
    } else if (tab == AppBottomTab.profile) {
      icon = Icon(FontAwesomeIcons.grinAlt, size: iconSize);
      title = Strings.profile;
    }
    return BottomNavigationBarItem(
      icon: icon!,
      // label: title,
      //? En caso de usar la propiedad Title
      title: Padding(
        padding: EdgeInsets.only(top: 3.0.dH),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10.sp),
        ),
      ),
    );
  }
}
