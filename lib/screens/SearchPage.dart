import 'package:flutter/material.dart';

import '../components/Cards/SmallVeggieCard.dart';
import '../components/Search.dart';
import '../data/veggie.dart';
import '../data/veggie_data.dart';
import '../styles/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  var items = <Veggie>[];

  @override
  void initState() {
    items = veggies;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = veggies
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 50 + $styles.padding.m,
        title: Padding(
          padding: EdgeInsets.symmetric(
            vertical: $styles.padding.m,
            horizontal: $styles.padding.xs,
          ),
          child: Search(
            filterSearchResults: filterSearchResults,
            editingController: editingController,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.padding.l),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: $styles.padding.s),
              child: SmallVeggieCard(veggie: items[index]),
            );
          },
        ),
      ),
    );
  }
}
