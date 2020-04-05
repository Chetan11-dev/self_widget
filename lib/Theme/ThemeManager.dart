import 'package:flutter/material.dart';
import 'package:self_widget/FunctionDart/high_order_function.dart';
import 'package:self_widget/Theme/Helpers/layout_helper.dart';
import 'package:self_widget/Theme/Helpers/sbHelper.dart';
import 'package:self_widget/Theme/font_text_theme.dart';
import 'package:self_widget/self_widget.dart';

// ORDER
// ThemeStyleManager
// ThemeDataManager
// UtilsManager

ThemeData Function() getThemeData;
FontTextTheme t;

class ThemeStyleManager {
  static instantiate(
          TextStyle Function({TextStyle textStyle}) f, BuildContext context) =>
      t = FontTextTheme(f, Theme.of(context).textTheme);
}

class ThemeDataManager {
  static instantiate(BuildContext context) =>
      getThemeData = giver(Theme.of(context));
}

class UtilsManager {
  static instantiate(BuildContext context) {
    final mediaQueryGiver = giver(MediaQuery.of(context));
    final dt = getDeviceType(mediaQueryGiver());
    final w = getWidth(mediaQueryGiver());
    final h = getHeight(mediaQueryGiver());

    Sizer.instantiate(dt,w,h);
  }
}
