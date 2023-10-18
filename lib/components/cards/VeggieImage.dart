import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class VeggieImage extends StatelessWidget {
  const VeggieImage({super.key, required this.veggie, required this.size});
  final Veggie veggie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final width = switch (size) {
      Size.small => 100.0,
      Size.large => double.infinity,
    };

    final height = switch (size) {
      Size.small => 100.0,
      Size.large => 200.0,
    };

    return Container(
        width: width,
        height: height,
        decoration: $styles.containerStyles.rounded,
        child: ClipRRect(
          borderRadius: $styles.borderStyle.roundedBorderRadius,
          child: Image(
              fit: BoxFit.cover, image: AssetImage(veggie.imageAssetPath)),
        ));
  }
}
