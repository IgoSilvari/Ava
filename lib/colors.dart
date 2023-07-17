import 'package:flutter/material.dart';

class AvaColor {
  static const MaterialColor appPrimarySwatch = MaterialColor(
    0xFF09043E,
    <int, Color>{
      50: Color(0xFF01000A),
      100: Color(0xFF020018),
      200: Color(0xFF040125),
      300: Color(0xFF060232),
      400: Color(0xFF09043E), //default
      500: Color(0xFF322E60),
      600: Color(0xFF5B5881),
      700: Color(0xFF8582A2),
      800: Color(0xFFAFADC3),
      900: Color(0xFFD9D9E3),
    },
  );

  static const defaultRedColor = Color(0xFFFF0930);
  static const defaultOrangeColor = Color(0xFFFE8E04);

  static LinearGradient linearGradient = const LinearGradient(
    colors: [
      appPrimarySwatch,
      defaultRedColor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
