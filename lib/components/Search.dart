import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  TextEditingController editingController;
  Function filterSearchResults;
  Search(
      {super.key,
      required this.editingController,
      required this.filterSearchResults});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: $styles.colors.black,
      style: $styles.text.subheading1,
      onChanged: (value) {
        filterSearchResults(value);
      },
      controller: editingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all($styles.padding.s),
        fillColor: $styles.colors.white,
        filled: true,
        hintText: "Try to find...",
        hintStyle:
            $styles.text.subheading1.copyWith(color: $styles.colors.grey),
        prefixIcon: SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: $styles.colors.black,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: $styles.colors.black,
              width: $styles.borderStyle.width,
            ),
            borderRadius: $styles.borderStyle.circularBorderRadius),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: $styles.colors.black,
              width: $styles.borderStyle.width,
            ),
            borderRadius: $styles.borderStyle.circularBorderRadius),
        //  Weird that just setting this didn't work
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: $styles.colors.black,
              width: $styles.borderStyle.width,
            ),
            borderRadius: $styles.borderStyle.circularBorderRadius),
      ),
    );
  }
}
