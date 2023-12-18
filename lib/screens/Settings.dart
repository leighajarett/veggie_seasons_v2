import 'package:flutter/material.dart';

import '../styles/styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $styles.padding.l,
            vertical: $styles.padding.xs,
          ),
          child: Text('Settings', style: $styles.text.heading1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: $styles.padding.xs,
            horizontal: $styles.padding.m,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: $styles.borderStyle.border,
              borderRadius: BorderRadius.circular(25),
              color: $styles.colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                    left: $styles.padding.m,
                    top: $styles.padding.xs,
                    right: $styles.padding.m,
                  ),
                  leading: const Icon(Icons.directions_run),
                  title: Text('Calorie Target', style: $styles.text.heading3),
                  onTap: () => debugPrint('[Tapped] Calorie Target!'),
                ),
                const Divider(thickness: 2),
                ListTile(
                  contentPadding: EdgeInsets.only(
                    left: $styles.padding.m,
                    right: $styles.padding.m,
                    bottom: $styles.padding.xs,
                  ),
                  leading: const Icon(Icons.favorite_border),
                  title: Text('Preferred Categories', style: $styles.text.heading3),
                  onTap: () => debugPrint('[Tapped] Preferred Categories!'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
