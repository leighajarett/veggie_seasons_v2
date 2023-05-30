import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/data/veggie_data.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:veggie_seasons_v2/ui/VeggieCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 0 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 0 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var subheading = Text(
      "Subheading",
      style: $styles.text.subheading2.copyWith(color: $styles.colors.grey),
    );

    var heading = Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "Heading",
        style: $styles.text.heading1.copyWith(color: $styles.colors.black),
      ),
    );

    // Return a listview of all the veggies
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverPersistentHeader(
        delegate: CustomAppBarDelegate(
          heading: Text(
            'Heading',
            style: TextStyle(
              fontSize: _isScrolled ? 20.0 : 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subheading: Opacity(
            opacity: _isScrolled ? 0.0 : 1.0,
            child: Text('Subheading'),
          ),
        ),
        pinned: true,
      ),
      SliverList.list(
        children: [
          for (Veggie veggie in veggies)
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: $styles.padding.m, horizontal: $styles.padding.l),
              child: VeggieCard(veggie: veggie),
            )
        ],
      ),
    ]);
  }
}

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget heading;
  final Widget subheading;

  CustomAppBarDelegate({
    required this.heading,
    required this.subheading,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: $styles.colors.background,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.padding.l),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: $styles.padding.xl + kToolbarHeight),
            subheading,
            heading,
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

AppStyle get $styles => AppStyle();
