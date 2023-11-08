import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';

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
              border: Border.all(
                color: $styles.colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
              color: $styles.colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  leading: const Icon(Icons.directions_run),
                  title: Text('Calorie Target', style: $styles.text.heading3),
                  onTap: () => debugPrint('[Tapped] Calorie Target!'),
                ),
                const Divider(thickness: 2),
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
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
