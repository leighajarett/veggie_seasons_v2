import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class SeasonCircle extends StatelessWidget {
  SeasonCircle({super.key, required this.size, required this.season});
  Size size;
  Season season;

  final sizeValues = {
    Size.small: $styles.seasonSizes.small,
    Size.large: $styles.seasonSizes.large,
  };

  final seasonColors = {
    Season.autumn: $styles.colors.autumn,
    Season.spring: $styles.colors.spring,
    Season.summer: $styles.colors.summer,
    Season.winter: $styles.colors.winter,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          $styles.containerStyles.rounded.copyWith(color: seasonColors[season]),
      // If the size is small, use the small seasons size from styles, if large use large
      width: sizeValues[size],
      height: sizeValues[size],
    );
  }
}
