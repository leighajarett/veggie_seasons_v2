import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:veggie_seasons_v2/components/cards/CardHeader.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieImage.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/screens/VeggieDetail.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class SmallVeggieCard extends StatelessWidget {
  SmallVeggieCard({super.key, required this.veggie});
  Veggie veggie;
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
        decoration: $styles.containerStyles.rounded,
        child: Padding(
          padding: EdgeInsets.all($styles.padding.m),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VeggieImage(veggie: veggie, size: size),
              SizedBox(width: $styles.padding.s),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardHeader(veggie: veggie, size: size),
                    const Gap(4),
                    SizedBox(
                      height: $styles.padding.xs,
                    ),
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
      ),
    );
  }
}
