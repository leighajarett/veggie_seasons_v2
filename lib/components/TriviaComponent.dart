import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/Button.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class TriviaComponent extends StatefulWidget {
  TriviaComponent({required this.trivia, super.key});

  Trivia trivia;

  @override
  State<TriviaComponent> createState() => _TriviaComponentState();
}

class _TriviaComponentState extends State<TriviaComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> triviaWidgets = [];

    Widget question =
        Text(widget.trivia.question, style: $styles.text.subheading1);

    triviaWidgets.add(question);

    triviaWidgets.add(SizedBox(height: $styles.padding.m));

    for (final answerOption in widget.trivia.answers) {
      triviaWidgets.add(
        Button(
          textString: answerOption,
          onPressed: () {},
        ),
      );
      triviaWidgets.add(SizedBox(height: $styles.padding.xs));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: triviaWidgets,
    );
  }
}
