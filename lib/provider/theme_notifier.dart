import 'package:flutter/material.dart';
import 'package:getx_todo_app/global_const/themes.dart';

class ThemeNotifier extends ChangeNotifier{

  bool isLightTheme=false;

  void changeTheme() {
    isLightTheme=!isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? LightTheme().themeLight:LightTheme().themeDark;
}