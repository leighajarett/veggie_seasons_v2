import 'package:flutter/material.dart';

import 'CardHeader.dart';
import 'VeggieImage.dart';
import '../../data/veggie.dart';
import '../../screens/VeggieDetail.dart';
import '../../styles/styles.dart';

class SmallVeggieCard extends StatelessWidget {
  const SmallVeggieCard({super.key, required this.veggie});
  final Veggie veggie;
  final size = Size.small;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VeggieDetail(veggie: veggie),
          ),
        );
      },
      child: Container(
        decoration: $styles.containerStyles.rounded(),
        padding: EdgeInsets.all($styles.padding.m),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VeggieImage(veggie: veggie, size: size),
            $styles.spacers.s,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(veggie: veggie, size: size),
                  $styles.spacers.s,
                  Text(
                    veggie.shortDescription,
                    style: $styles.text.subheading2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
