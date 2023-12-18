import 'package:flutter/widgets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../styles/styles.dart';

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
  const Circle({required this.size, required this.color, this.text = '', super.key});

  final double size;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: $styles.containerStyles.circular.copyWith(color: color),
      child: Center(
        child: Text(
          text,
          style: text.length > 2 ? $styles.text.heading3 : $styles.text.heading2,
        ),
      ),
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
