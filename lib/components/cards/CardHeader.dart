import 'package:flutter/widgets.dart';

import 'VeggieCardSeasons.dart';
import '../../data/veggie.dart';
import '../../styles/styles.dart';

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
