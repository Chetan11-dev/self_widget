import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeInfo {
  static final Color background = const Color(0xFF6874C2);

  static final Color color = Colors.white;

  static const _regular = FontWeight.w400,
      _medium = FontWeight.w500,
      _light = FontWeight.w300;

  final theme = TextTheme(
    overline: overline,
    button: button,
    caption: caption,
    body2: body2,
    body1: body1,
    title: title,
    subtitle: subtitle,
    subhead: subhead,
    display1: display1,
  );

  static final overline = GoogleFonts.montserrat(
      fontWeight: _regular, fontSize: 10.0, color: color);

  static final button =
      GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0, color: color);

  static final caption = GoogleFonts.montserrat(
      fontWeight: _regular, fontSize: 14.0, color: color);

  static final body2 = GoogleFonts.montserrat(
      fontWeight: _regular, fontSize: 14.0, color: color);

  static final body1 = GoogleFonts.montserrat(
      fontWeight: _regular, fontSize: 16.0, color: color);

  static final title = GoogleFonts.montserrat(
      // textAppearanceSubtitle1
      fontWeight: _regular,
      fontSize: 16.0,
      color: color);

  static final subtitle = GoogleFonts.montserrat(
      // textAppearanceSubtitle2
      fontWeight: _medium,
      fontSize: 14.0,
      color: color);

  static final subhead =
      GoogleFonts.montserrat(fontWeight: _medium, fontSize: 20.0, color: color);

  static final display1 =
      GoogleFonts.montserrat(fontWeight: _light, fontSize: 96.0, color: color);
}
