import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/SeasonCircle.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class VeggieCardSeasons extends StatelessWidget {
  const VeggieCardSeasons(
      {super.key, required this.veggie, required this.size});
  final Veggie veggie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (Season season in veggie.seasons)
          Padding(
            padding: EdgeInsets.only(
              left: size == Size.large ? $styles.padding.s : $styles.padding.xs,
            ),
            child: SeasonCircle(
              size: size,
              season: season,
            ),
          )
      ],
    );
  }
}
