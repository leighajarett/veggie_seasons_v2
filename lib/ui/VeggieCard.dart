import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:veggie_seasons_v2/ui/SeasonCircle.dart';

class VeggieCard extends StatelessWidget {
  VeggieCard({super.key, required this.veggie});
  Veggie veggie;

  @override
  Widget build(BuildContext context) {
    var img = Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: $styles.colors.black,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
              fit: BoxFit.cover, image: AssetImage(veggie.imageAssetPath)),
        ));

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(veggie.name, style: $styles.text.heading2),
        VeggieCardSeasons(
          veggie: veggie,
        )
      ],
    );

    var description = Text(veggie.shortDescription);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: $styles.colors.white,
        border: Border.all(
          color: $styles.colors.black,
          // TO DO: add stroke to width to styles
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all($styles.padding.m),
        child: Column(
          children: [
            img,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: $styles.padding.m, bottom: $styles.padding.s),
                  child: header,
                ),
                description
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VeggieCardSeasons extends StatelessWidget {
  VeggieCardSeasons({super.key, required this.veggie});
  Veggie veggie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (Season season in veggie.seasons)
          Padding(
            padding: EdgeInsets.only(left: $styles.padding.xs),
            child: SeasonCircle(
              size: Size.small,
              season: season,
            ),
          )
      ],
    );
  }
}

// TO DO: how to avoid writing this in every file?
AppStyle get $styles => AppStyle();
