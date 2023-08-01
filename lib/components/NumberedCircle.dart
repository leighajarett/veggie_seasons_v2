import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class NumberedCircle extends StatelessWidget {
  NumberedCircle({Key? key, required this.number}) : super(key: key);
  String number;
  double containerW = 60;

  @override
  Widget build(BuildContext context) {
    if (number == "One") {
      number = "1";
    }

    return Container(
      decoration: $styles.containerStyles.circular.copyWith(
        color: $styles.colors.summer,
      ),
      width: containerW,
      height: containerW,
      child: Center(
        child: Text(
          number,
          style:
              number.length > 2 ? $styles.text.heading3 : $styles.text.heading2,
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
  return NumberedCircle(
    number: "1",
  );
}
