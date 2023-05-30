import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veggie_seasons_v2/data/veggie_data.dart';
import 'package:veggie_seasons_v2/screens/Home.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:veggie_seasons_v2/ui/Button.dart';
import 'package:veggie_seasons_v2/ui/CustomNavigationBar.dart';
import 'package:veggie_seasons_v2/ui/VeggieCard.dart';

void main() async {
  runApp(VeggieSeasonsApp());
}

/// Creates an app using [MaterialApp]
class VeggieSeasonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veggie Seasons',
      theme: ThemeData(
        scaffoldBackgroundColor: $styles.colors.background,
        fontFamily: $styles.text.fontFamily,
        colorScheme: $styles.colors.toColorScheme(),
      ),
      home: DefaultTabController(length: 4, child: Page()),
    );
  }
}

AppStyle get $styles => AppStyle();

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> with TickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handleTabChanged);
    tabIndex = _tabController.index;
  }

  void _handleTabChanged() {
    setState(() {
      tabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        tabController: _tabController,
      ),
      body: IndexedStack(
        index: tabIndex,
        children: [
          Home(),
          Center(
            child: Button(
              textString: "hi garden",
              onPressed: () {},
            ),
          ),
          Center(
            child: Button(
              textString: "hi search",
              onPressed: () {},
            ),
          ),
          Center(
            child: Button(
              textString: "hi profile",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
