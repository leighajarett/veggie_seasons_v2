import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/data/veggie_data.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Get todays date as a string with month and year
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final now = DateTime.now();
    final month = now.month;

    String getMonthYear() {
      final year = now.year;
      final monthName = months[month - 1];
      return '$monthName $year';
    }

    Season getSeason() {
      switch (month) {
        case 12 || 1 || 2:
          {
            return Season.winter;
          }
        case 3 || 4 || 5:
          {
            return Season.spring;
          }
        case 6 || 7 || 8:
          {
            return Season.summer;
          }
        default:
          {
            return Season.autumn;
          }
      }
    }

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          delegate: CustomSliverHeaderDelegate(monthYear: getMonthYear()),
          pinned: true,
          floating: false,
        ),
        SliverList.list(
          children: [
            for (Veggie veggie
                in veggies.where((v) => v.seasons.contains(getSeason())))
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: $styles.padding.m, horizontal: $styles.padding.l),
                child: VeggieCard(veggie: veggie),
              )
          ],
        ),
      ]),
    );
  }
}

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $styles.padding.l),
            child: Padding(
              padding: EdgeInsets.only(bottom: $styles.padding.s),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    progress < 1
                        ? AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: progress < 0.7 ? 1.0 : 0.0,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: $styles.padding.xs),
                              child: Text(
                                monthYear,
                                style: $styles.text.subheading1
                                    .copyWith(color: $styles.colors.black),
                              ),
                            ))
                        : const SizedBox.shrink(),
                    AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: progress < 1
                            ? $styles.text.heading1
                                .copyWith(color: $styles.colors.black)
                            : $styles.text.heading2
                                .copyWith(color: $styles.colors.black),
                        child: const Text("In season today")),
                  ]),
            ),
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
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
