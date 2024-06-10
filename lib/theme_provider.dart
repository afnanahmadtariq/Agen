import 'package:agen/theme-data.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = blueTheme;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(int val){
    switch(val){
      case 0:
        themeData = lightTheme;
        break;
      case 1:
        themeData = darkTheme;
        break;
      case 2:
        themeData = blueTheme;
        break;
      case 3:
        themeData = pinkTheme;
        break;
      case 4:
        themeData = amberTheme;
        break;
      default:
        themeData = blueTheme;
    }
  }
}