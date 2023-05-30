import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veggie_seasons_v2/styles/colors.dart';

@immutable
class AppStyle {
  // Text styles
  late final _Text text = _Text();
  late final AppColors colors = AppColors();
  late final BorderRadius borderRadius = BorderRadius.circular(100);
  late final _Padding padding = _Padding();
  late final _SeasonSizes seasonSizes = _SeasonSizes();
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
    heading1 = font.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    );

    heading2 = font.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );

    heading3 = font.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    subheading1 = font.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );

    subheading2 = font.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );

    label = font.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );

    paragraph = font.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
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
/// Later: accessibility, dynamic sizes, localization.

// Tokens should have references
// example -- fontfamilies.Heading is one and that's used in the heading5 font style
// auto layout is great, but we don't have reusable values (for things like padding)