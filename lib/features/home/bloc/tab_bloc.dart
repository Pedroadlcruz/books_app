import 'package:flutter/material.dart';
import 'package:take_home_project/features/home/models/app_bottom_tab.dart';

class TabBloc extends ChangeNotifier {
  AppBottomTab currentTab = AppBottomTab.home;

  void onUpdateTab(AppBottomTab tab) {
    currentTab = tab;
    notifyListeners();
  }
}
