import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF60CAE7);
  static const Color primaryAccent = Color(0xFF4A8CCA);

  static const Color secondaryColor = Color(0xFFFF1B6B);

  static const Color backgroundColorWhite = Color(0xFFFFFFFF);

  static const String fontFamily = 'Nunito';

  static const headlineMedium = TextStyle(
    fontSize: 15,
    fontFamily: fontFamily,
    color: primaryColor,
  );

  static const headlineBig = TextStyle(
    fontSize: 25,
    fontFamily: fontFamily,
    color: primaryColor,
  );
  static var themeData = ThemeData(
    // colorScheme: colorScheme,
    textTheme: const TextTheme(
      headlineMedium: headlineMedium,
      headlineLarge: headlineBig,
    ),
  );
}
