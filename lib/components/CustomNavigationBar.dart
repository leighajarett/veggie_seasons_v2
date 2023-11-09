import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.tabController.index;
    widget.tabController.addListener(_handleTabChanged);
  }

  void _handleTabChanged() {
    setState(() {
      selectedIndex = widget.tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.tabController.index.toString());
    const List<IconData> icons = [
      FontAwesomeIcons.house,
      FontAwesomeIcons.list,
      FontAwesomeIcons.magnifyingGlass,
      FontAwesomeIcons.solidUser,
    ];

    double containerW = 46;
    double iconContainerW = containerW / 2;
    double totalWidth = MediaQuery.of(context).size.width;
    double freeSpace = (totalWidth - (iconContainerW * icons.length)) / (icons.length + 1);
    double xOffset = ((freeSpace + iconContainerW) * selectedIndex) + freeSpace - (iconContainerW / 2);

    return Container(
      height: containerW + iconContainerW, 
      color: $styles.colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              left: xOffset,
              top: $styles.padding.s,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubicEmphasized,
              child: Container(
                height: containerW,
                width: containerW,
                decoration: $styles.containerStyles.circular.copyWith(
                  color: $styles.colors.winter,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: icons.asMap().entries.map((entry) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        selectedIndex = entry.key;
                        widget.tabController.animateTo(entry.key);
                      });
                    },
                    child: SizedBox.square(
                      dimension: iconContainerW,
                      child: FaIcon(
                        size: iconContainerW,
                        entry.value,
                        color: $styles.colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Unsure how to do this -- need to think a little
// @widgetbook.UseCase(
//   name: 'Bottom Navigation Bar',
//   type: CustomNavigationBar,
// )
// Widget buttonUseCase(BuildContext context) {
//   return CustomNavigationBar(
//       tabController: TabController(
//     length: 4,
//     vsync: this,
//     initialIndex: 0,
//   ));
// }
