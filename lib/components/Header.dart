import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

// Future -- it would be cool to have some "overscrolling"
class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  CustomSliverHeaderDelegate({required this.monthYear});

  final String monthYear;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / (maxExtent - minExtent);

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: $styles.colors.background,
          padding: EdgeInsets.only(
            left: $styles.padding.l,
            right: $styles.padding.l,
            bottom: $styles.padding.s
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (progress < 1)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: progress < 0.7 ? 1.0 : 0.0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: $styles.padding.xs),
                    child: Text(
                      monthYear,
                      style: $styles.text.subheading1.copyWith(color: $styles.colors.black),
                    ),
                  ),
                ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: progress < 1
                  ? $styles.text.heading1.copyWith(color: $styles.colors.black)
                  : $styles.text.heading2.copyWith(color: $styles.colors.black),
                child: const Text("In season today")),
            ]
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => kToolbarHeight + 44;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
