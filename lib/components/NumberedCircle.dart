import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class NumberedCircle extends StatelessWidget {
  const NumberedCircle({Key? key, required this.number}) : super(key: key);
  final String number;
  final double containerW = 60;

  @override
  Widget build(BuildContext context) {
    return Circle(
      color: $styles.colors.summer,
      size: containerW,
      text: number,
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({required this.size, required this.color, this.text, super.key});

  final double size;
  final Color color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: $styles.colors.black,
            width: 2,
          )),
      child: text != null
          ? Center(
              child: Text(text!,
                  style: text!.length > 2
                      ? $styles.text.heading3
                      : $styles.text.heading2),
            )
          : null,
    );
  }
}

@widgetbook.UseCase(
  name: 'Numbered Circle',
  type: NumberedCircle,
)
Widget numberedCircleUseCase(BuildContext context) {
  return const NumberedCircle(
    number: "1",
  );
}
