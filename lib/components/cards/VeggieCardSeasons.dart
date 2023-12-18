import 'package:flutter/widgets.dart';

import '../SeasonCircle.dart';
import '../../data/veggie.dart';
import '../../styles/styles.dart';

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
