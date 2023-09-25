import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/Button.dart';
import 'package:veggie_seasons_v2/data/veggie.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class TriviaComponent extends StatefulWidget {
  TriviaComponent({required this.trivias, super.key});

  List<Trivia> trivias;

  @override
  State<TriviaComponent> createState() => _TriviaComponentState();
}

class _TriviaComponentState extends State<TriviaComponent> {
  late Trivia trivia;

  @override
  void initState() {
    getRandomTrivia();
    super.initState();
  }

  void getRandomTrivia() {
    final rand = Random();
    setState(() {
      trivia = widget.trivias[rand.nextInt(widget.trivias.length)];
    });
  }

  bool triviaAnswerIsCorrect(int answerIndex) {
    return answerIndex == trivia.correctAnswerIndex;
  }

  Future<void> _showCorrectAnswerBanner() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('🎉 Good Job!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You got the correct answer.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Next question'),
              onPressed: () {
                getRandomTrivia();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> triviaWidgets = [];

    Widget question = Text(trivia.question, style: $styles.text.subheading1);

    triviaWidgets.add(question);

    triviaWidgets.add(SizedBox(height: $styles.padding.m));

    for (int answerIndex = 0;
        answerIndex < trivia.answers.length;
        answerIndex++) {
      triviaWidgets.add(
        Button(
          textString: trivia.answers[answerIndex],
          onPressed: () {
            if (triviaAnswerIsCorrect(answerIndex)) {
              print('answer is correct!');
              _showCorrectAnswerBanner();
            }
          },
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
