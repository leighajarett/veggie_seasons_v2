import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomSwitch extends StatefulWidget {
  /// Public properties, set on constructor
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  final Color activeColor = $styles.colors.spring;
  final Color inactiveColor = $styles.colors.grey;
  final Color thumbColor = $styles.colors.white;
  final double trackHeight = 12;
  final double trackWidth = 50;
  final double trackBorderRadius = 100;
  final double thumbHeight = 26;

  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));

    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  // Why is this necessary? Does the animation controller need to be restarted?
  void handleAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("switch value ${widget.value}");

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              debugPrint("tap");
              handleAnimation();
              widget.onChanged(!widget.value);
            },
            // onHorizontalDragStart: (details) {
            //   print("started drag");
            //   handleAnimation();
            //   widget.onChanged(!widget.value);
            // },
            // onHorizontalDragUpdate: (details) {
            //   print("dragging");
            //   double value = details.localPosition.dx / trackWidth;
            //   print(details.localPosition.dx);
            //   print(value);
            //   _animationController.value = -value;
            // },
            onHorizontalDragEnd: (details) {
              handleAnimation();
            },
            child: Stack(
              alignment: _circleAnimation.value,
              children: [
                Track(
                  trackWidth: trackWidth,
                  trackHeight: trackHeight,
                  widget: widget,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                ),
                Thumb(
                  thumbColor: thumbColor,
                  thumbHeight: thumbHeight,
                ),
              ],
            ));
      },
    );
  }
}

class Track extends StatelessWidget {
  const Track({
    super.key,
    required this.trackWidth,
    required this.trackHeight,
    required this.widget,
    required this.activeColor,
    required this.inactiveColor,
  });

  final double trackWidth;
  final double trackHeight;
  final CustomSwitch widget;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: trackWidth,
      height: trackHeight,
      decoration: BoxDecoration(
        borderRadius: $styles.borderStyle.trackBorderRadius,
        color: widget.value ? activeColor : inactiveColor,
        border: $styles.borderStyle.border,
      ),
    );
  }
}

class Thumb extends StatelessWidget {
  const Thumb({
    super.key,
    required this.thumbColor,
    required this.thumbHeight,
  });

  final Color thumbColor;
  final double thumbHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: thumbHeight,
      height: thumbHeight,
      decoration: $styles.containerStyles.circular.copyWith(
        color: thumbColor,
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Switch',
  type: CustomSwitch,
)
Widget switchUseCase(BuildContext context) {
  var value = true;

  return CustomSwitch(
    value: value,
    onChanged: (value) {
      value = !value;
    },
  );
}
