import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/cards/SmallVeggieCard.dart';
import '../data/veggie.dart';
import '../data/veggie_data.dart';
import '../styles/styles.dart';

class Garden extends StatefulWidget {
  const Garden({super.key});

  @override
  State<Garden> createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Get the daily calorie intake
  Future<List<Veggie>> _checkGarden() async {
    final SharedPreferences prefs = await _prefs;
    final gardenVeggies =
        veggies.where((element) => prefs.containsKey(element.name)).toList();
    return gardenVeggies;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      CupertinoSliverNavigationBar(
        largeTitle: Text("Garden", style: $styles.text.font),
        backgroundColor: Colors.transparent,
        border: null,
      ),
      FutureBuilder<List<Veggie>>(
        future: _checkGarden(),
        builder: (BuildContext context, AsyncSnapshot<List<Veggie>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: $styles.padding.s),
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.hasData) {
            return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: $styles.padding.l),
              sliver: SliverList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: $styles.padding.s),
                    child: SmallVeggieCard(veggie: snapshot.data![index]),
                  );
                },
                itemCount: snapshot.data!.length,
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: $styles.padding.s),
                child: const Center(child: Text("No veggies found.")),
              ),
            );
          }
        },
      ),
    ]);
  }
}
