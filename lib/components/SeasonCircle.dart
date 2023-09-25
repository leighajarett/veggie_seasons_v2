import 'package:veggie_seasons_v2/components/NumberedCircle.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';

class SeasonCircle extends StatelessWidget {
  SeasonCircle({super.key, required this.size, required this.season});
  final Size size;
  final Season season;

  final Map<Size, double> sizeValues = {
    Size.small: $styles.seasonSizes.small,
    Size.large: $styles.seasonSizes.large,
  };

  final Map<Season, Color> seasonColors = {
    Season.autumn: $styles.colors.autumn,
    Season.spring: $styles.colors.spring,
    Season.summer: $styles.colors.summer,
    Season.winter: $styles.colors.winter,
  };

  @override
  Widget build(BuildContext context) {
    double? sizeAsDouble = sizeValues[size];

    Color? seasonAsColor = seasonColors[season];

    if (sizeAsDouble == null || seasonAsColor == null) {
      return Circle(size: 60, color: $styles.colors.white);
    }

    return Circle(size: sizeAsDouble, color: seasonAsColor);
  }
}
