import 'package:flutter/material.dart';

/// Colors are separated into their own file because they change based on light or dark themes.

class AppColors {
  final Color spring = const Color.fromRGBO(79, 173, 133, 1);
  final Color background = const Color.fromRGBO(253, 247, 240, 1);
  final Color autumn = const Color.fromRGBO(222, 122, 96, 1);
  final Color white = const Color.fromRGBO(255, 255, 255, 1);
  final Color summer = const Color.fromRGBO(255, 171, 199, 1);
  final Color winter = const Color.fromRGBO(162, 227, 246, 1);
  final Color grey = const Color.fromRGBO(174, 174, 174, 1);
  final Color black = const Color.fromRGBO(0, 0, 0, 1);

  final bool isDark = false;

  ColorScheme toColorScheme() {
    ColorScheme colorScheme = ColorScheme(
        // Map our custom theme to the Material ColorScheme
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: spring,
        primaryContainer: spring,
        secondary: autumn,
        secondaryContainer: autumn,
        background: background,
        surface: background,
        onBackground: black,
        onSurface: black,
        onError: black,
        onPrimary: white,
        onSecondary: black,
        error: autumn);

    return colorScheme;
  }
}

// what about dark mode
