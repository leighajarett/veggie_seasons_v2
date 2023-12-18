import 'package:flutter/material.dart';

import '../styles/styles.dart';

class Toggle extends StatefulWidget {
  const Toggle({required this.onPressed, super.key});

  final Function onPressed;

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  String selected = 'Facts & Info';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: $styles.padding.s),
            child: SegmentedButton<String>(
              showSelectedIcon: false,
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all<Color>($styles.colors.winter),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return $styles.colors.winter;
                  }
                  return $styles.colors.white;
                }),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: $styles.borderStyle.stroke,
                    width: $styles.borderStyle.width,
                  ),
                ),
              ),
              segments: <ButtonSegment<String>>[
                ButtonSegment<String>(
                  value: 'Facts & Info',
                  label: Text('Facts & Info', style: $styles.text.heading3),
                ),
                ButtonSegment<String>(
                  value: 'Trivia',
                  label: Text('Trivia', style: $styles.text.heading3),
                )
              ],
              selected: <String>{selected},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  widget.onPressed(newSelection);
                  selected = newSelection.first;
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
