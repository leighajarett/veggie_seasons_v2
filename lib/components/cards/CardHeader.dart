import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieCardSeasons.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieImage.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:veggie_seasons_v2/components/SeasonCircle.dart';

class CardHeader extends StatelessWidget {
  CardHeader({super.key, required this.veggie, required this.size});
  Veggie veggie;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(veggie.name, style: $styles.text.heading2),
        VeggieCardSeasons(
          veggie: veggie,
          size: size,
        )
      ],
    );
  }
}