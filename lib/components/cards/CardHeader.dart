import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieCardSeasons.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.veggie, required this.size});
  final Veggie veggie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            veggie.name,
            style: $styles.text.heading2,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        VeggieCardSeasons(
          veggie: veggie,
          size: size,
        )
      ],
    );
  }
}
