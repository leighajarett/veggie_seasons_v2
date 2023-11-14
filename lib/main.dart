import 'package:flutter/material.dart';

import 'components/CustomNavigationBar.dart';
import 'screens/Garden.dart';
import 'screens/Home.dart';
import 'screens/SearchPage.dart';
import 'screens/Settings.dart';
import 'styles/styles.dart';

void main() async {
  runApp(const VeggieSeasonsApp());
}

/// Creates an app using [MaterialApp]
class VeggieSeasonsApp extends StatelessWidget {
  const VeggieSeasonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veggie Seasons',
      theme: ThemeData(
        scaffoldBackgroundColor: $styles.colors.background,
        // fontFamily: $styles.text.fontFamily,
        colorScheme: $styles.colors.toColorScheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const DefaultTabController(length: 4, child: Page()),
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
  bool value = true;

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
        children: const [
          Home(),
          Garden(),
          SearchPage(),
          SettingsScreen(),
        ],
      ),
    );
  }
}
