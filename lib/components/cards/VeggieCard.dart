import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/cards/CardHeader.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieImage.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/screens/VeggieDetail.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class VeggieCard extends StatelessWidget {
  const VeggieCard({super.key, required this.veggie});
  final Veggie veggie;
  final size = Size.large;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VeggieImage(veggie: veggie, size: size),
            Padding(
              padding: EdgeInsets.symmetric(vertical: $styles.padding.s),
              child: CardHeader(veggie: veggie, size: size),
            ),
            Text(
              veggie.shortDescription,
              style: $styles.text.subheading2,
            )
          ], 
        ),
      ),
    );
  }
}
