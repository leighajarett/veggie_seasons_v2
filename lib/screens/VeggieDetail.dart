import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veggie_seasons_v2/components/CustomSwitch.dart';
import 'package:veggie_seasons_v2/components/NumberedCircle.dart';
import 'package:veggie_seasons_v2/components/TriviaComponent.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieCardSeasons.dart';
import 'package:veggie_seasons_v2/components/cards/VeggieImage.dart';
import 'package:veggie_seasons_v2/components/toggle.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class VeggieDetail extends StatefulWidget {
  const VeggieDetail({super.key, required this.veggie});
  final Veggie veggie;

  @override
  State<VeggieDetail> createState() => _VeggieDetailState();
}

class _VeggieDetailState extends State<VeggieDetail> {
  bool trivia = false;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late Future<bool> _inGarden;
  // late Future<int> _dailyCalories;

  // Check to see if the veggie is saved to the garden
  Future<bool> _checkGarden() async {
    final SharedPreferences prefs = await _prefs;
    final bool inGarden = prefs.containsKey(widget.veggie.name);
    return inGarden;
  }

  // Get the daily calorie intake
  Future<int> _getCalorie() async {
    final SharedPreferences prefs = await _prefs;
    final int dailyCalories = prefs.getInt("dailyCalories") ?? 2000;
    return dailyCalories;
  }

  // Save the veggie to the garden
  Future<void> _setGarden(bool value) async {
    final SharedPreferences prefs = await _prefs;
    // prefs.remove(widget.veggie.name);
    if (value) {
      // Add to garden
      prefs.setBool(widget.veggie.name, value);
    } else {
      // Remove from garden
      prefs.remove(widget.veggie.name);
    }
  }

  void toggleFactTrivia(Set<String> selectedVals) {
    setState(() {
      trivia = (selectedVals.first == 'Trivia');
    });
  }

  Widget _regularComponent(Widget servingInfo) {
    return Column(
      children: [
        Text(
          "SERVING INFO",
          style: $styles.text.heading3.copyWith(color: $styles.colors.black),
        ),
        SizedBox(height: $styles.padding.xs),
        Container(
          decoration: BoxDecoration(
            color: $styles.colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: $styles.colors.black,
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all($styles.padding.m),
            child: Column(
              children: [
                servingInfo,
                SizedBox(height: $styles.padding.m),
                FutureBuilder(
                    future: _getCalorie(),
                    initialData: 2000,
                    builder: (context, snapshot) {
                      return Text(
                        "Percent daily values based on a diet of ${snapshot.data} calories",
                        style: $styles.text.paragraph
                            .copyWith(color: $styles.colors.grey),
                      );
                    },),
              ],
            ),
          ),
        ),
        SizedBox(height: $styles.padding.m),
        Row(
          children: [
            FutureBuilder(
                future: _checkGarden(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    debugPrint("data ${snapshot.data!}");
                    return CustomSwitch(
                      value: snapshot.data!,
                      onChanged: (value) {
                        setState(() {
                          _setGarden(value);
                        });
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
            SizedBox(width: $styles.padding.xs),
            Text(
              "Save to garden",
              style: $styles.text.label.copyWith(color: $styles.colors.grey),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var servingWords = widget.veggie.servingSize.split(" ");

    var servingInfo = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ServingInfo(
          number: servingWords[0],
          label: servingWords.sublist(1).join(" ").capitalize(),
        )),
        Expanded(child: ServingInfo(
          number: widget.veggie.caloriesPerServing.toString(),
          label: "kCal",
        )),
        Expanded(child: ServingInfo(
          number: "${widget.veggie.vitaminAPercentage}%",
          label: "Vitamin A",
        )),
        Expanded(child: ServingInfo(
          number: "${widget.veggie.vitaminCPercentage}%",
          label: "Vitamin C",
        )),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: $styles.colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.padding.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.veggie.categoryName?.toUpperCase() ?? "",
              style:
                  $styles.text.subheading1.copyWith(color: $styles.colors.grey),
            ),
            SizedBox(height: $styles.padding.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.veggie.name,
                  style: $styles.text.heading1
                      .copyWith(color: $styles.colors.black),
                ),
                VeggieCardSeasons(size: Size.large, veggie: widget.veggie),
              ],
            ),
            SizedBox(height: $styles.padding.s),
            Text(
              widget.veggie.shortDescription,
              style:
                  $styles.text.subheading1.copyWith(color: $styles.colors.grey),
            ),
            SizedBox(height: $styles.padding.s),
            VeggieImage(veggie: widget.veggie, size: Size.large),
            SizedBox(height: $styles.padding.m),
            Toggle(onPressed: toggleFactTrivia),
            SizedBox(height: $styles.padding.s),
            trivia
                ? TriviaComponent(trivias: widget.veggie.trivia)
                : _regularComponent(servingInfo),
          ],
        ),
      ),
    );
  }
}

class ServingInfo extends StatelessWidget {
  const ServingInfo({
    super.key,
    required this.number,
    required this.label,
  });

  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberedCircle(number: number),
        SizedBox(height: $styles.padding.xs),
        Text(
          label,
          style: $styles.text.label,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
