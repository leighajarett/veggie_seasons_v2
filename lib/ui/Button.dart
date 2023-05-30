import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

class Button extends StatelessWidget {
  String textString;
  void Function()? onPressed;
  Button({super.key, required this.textString, required this.onPressed});

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
      borderRadius: $styles.borderRadius,
    );

    final padding = EdgeInsets.symmetric(
        horizontal: $styles.padding.m, vertical: $styles.padding.s);

    final border = BorderSide(color: $styles.colors.black, width: 2);

    return TextButton(
        onPressed: onPressed,
        child: textWidget,
        style: ButtonStyle(
          // Would be helpful to have guidance on when to use ButtonStyle versus TextButton.styleFrom
          // Couldn't figure out how to get the hover color to work (may be the simulator)
          backgroundColor: overlayColor,
          surfaceTintColor:
              MaterialStateProperty.all<Color>(Colors.transparent),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: overlayColor,
          shape: MaterialStateProperty.all<OutlinedBorder>(shape),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          side: MaterialStateProperty.all<BorderSide>(border),
          splashFactory: NoSplash.splashFactory,
        ));
  }
}

AppStyle get $styles => AppStyle();

// style: ButtonStyle(
//   // Want to directly use the color but cant
//   // backgroundColor: backgroundColor,
//   backgroundColor: MaterialStateProperty.all<Color>($styles.colors.white),
//   surfaceTintColor: MaterialStateProperty.all<Color>(Colors.transparent),
//   shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
//   overlayColor: MaterialStateProperty.all<Color>($styles.colors.spring),
//   shape: MaterialStateProperty.all<OutlinedBorder>(shape),
//   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
//   side: MaterialStateProperty.all<BorderSide>(border),
//   splashFactory: NoSplash.splashFactory,
// ),
