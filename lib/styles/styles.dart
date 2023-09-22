import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veggie_seasons_v2/styles/colors.dart';

@immutable
class AppStyle {
  // Text styles
  late final _Text text = _Text();
  late final AppColors colors = AppColors();
  late final _Padding padding = _Padding();
  late final _SeasonSizes seasonSizes = _SeasonSizes();
  late final _ContainerStyles containerStyles = _ContainerStyles();
  late final _BorderStyle borderStyle = _BorderStyle();
}

@immutable
class _Text {
  final TextStyle font = GoogleFonts.lexend();
  final String? fontFamily = GoogleFonts.lexend().fontFamily;

  late final TextStyle heading1;
  late final TextStyle heading2;
  late final TextStyle heading3;
  late final TextStyle subheading1;
  late final TextStyle subheading2;
  late final TextStyle subheading3;
  late final TextStyle paragraph;
  late final TextStyle label;

  _Text() {
    heading1 =
        font.copyWith(fontSize: 32, fontWeight: FontWeight.w700, height: 1);

    heading2 =
        font.copyWith(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3);

    heading3 =
        font.copyWith(fontSize: 16, fontWeight: FontWeight.w600, height: 1.0);

    subheading1 =
        font.copyWith(fontSize: 18, fontWeight: FontWeight.w400, height: 1.0);

    subheading2 =
        font.copyWith(fontSize: 13, fontWeight: FontWeight.w400, height: 1.0);

    label =
        font.copyWith(fontSize: 12, fontWeight: FontWeight.w600, height: 1.0);

    paragraph =
        font.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.0);
  }
}

class _Padding {
  final xl = 32.0;
  final l = 24.0;
  final m = 16.0;
  final s = 12.0;
  final xs = 6.0;
}

class _SeasonSizes {
  final small = 20.0;
  final large = 25.0;
}

class _ContainerStyles {
  final BoxDecoration circular = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: $styles.borderStyle.stroke,
      width: $styles.borderStyle.width,
    ),
  );

  final BoxDecoration rounded = BoxDecoration(
    borderRadius: $styles.borderStyle.roundedBorderRadius,
    color: $styles.colors.white,
    border: Border.all(
      color: $styles.borderStyle.stroke,
      width: $styles.borderStyle.width,
    ),
  );
}

class _BorderStyle {
  final Color stroke = $styles.colors.black;
  final double width = 2;
  final BorderRadius roundedBorderRadius = BorderRadius.circular(20);
  final BorderRadius circularBorderRadius = BorderRadius.circular(100);
  final BorderRadius trackBorderRadius = BorderRadius.circular(50);
}

AppStyle get $styles => AppStyle();

/// Later: accessibility, dynamic sizes, localization.

