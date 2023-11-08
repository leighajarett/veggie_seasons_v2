import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class Button extends StatelessWidget {
  const Button({super.key, required this.textString, required this.onPressed});

  final String textString;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // if we were using tokens, maybe this is styles.text.button which inherits from label
    final Text textWidget = Text(
      textString,
      style: $styles.text.label.copyWith(color: $styles.colors.black),
    );

    final overlayColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.hovered)) {
          return $styles.colors.summer;
        }
        return $styles.colors.white;
      },
    );

    final shape = RoundedRectangleBorder(
      borderRadius: $styles.borderStyle.roundedBorderRadius,
    );

    final padding = EdgeInsets.symmetric(
      horizontal: $styles.padding.m, vertical: $styles.padding.s);

    final border = BorderSide(
      color: $styles.borderStyle.stroke, width: $styles.borderStyle.width);

    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // Would be helpful to have guidance on when to use ButtonStyle versus TextButton.styleFrom
          backgroundColor: overlayColor,
          surfaceTintColor:
              MaterialStateProperty.all<Color>(Colors.transparent),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: overlayColor,
          shape: MaterialStateProperty.all<OutlinedBorder>(shape),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          side: MaterialStateProperty.all<BorderSide>(border),
          splashFactory: NoSplash.splashFactory,
        ),
        child: textWidget);
  }
}

@widgetbook.UseCase(
  name: 'Trivia Button',
  type: Button,
)
Widget buttonUseCase(BuildContext context) {
  return Button(
    textString: "Trivia",
    onPressed: () {},
  );
}
