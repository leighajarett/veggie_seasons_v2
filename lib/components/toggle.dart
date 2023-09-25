import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class Toggle extends StatefulWidget {
  Toggle({required this.onPressed, super.key});

  Function onPressed;

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
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 0,
            ),
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
                    color: $styles.colors.black,
                    width: 2,
                  ),
                ),
              ),
              segments: <ButtonSegment<String>>[
                ButtonSegment<String>(
                  value: 'Facts & Info',
                  label: Text(
                    'Facts & Info',
                    style: $styles.text.heading3,
                  ),
                ),
                ButtonSegment<String>(
                  value: 'Trivia',
                  label: Text(
                    'Trivia',
                    style: $styles.text.heading3,
                  ),
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
