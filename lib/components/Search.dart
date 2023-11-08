import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.editingController,
    required this.filterSearchResults,
  });

  final TextEditingController editingController;
  final Function filterSearchResults;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: $styles.borderStyle.stroke,
        width: $styles.borderStyle.width,
      ),
      borderRadius: $styles.borderStyle.circularBorderRadius,
    );

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
        prefixIcon: SizedBox.square(
          dimension: 20,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: $styles.colors.black,
            ),
          ),
        ),
        focusedBorder: border,
        enabledBorder: border,
        //  Weird that just setting this didn't work
        // What did not work? We should file a bug.
        border: border,
      ),
    );
  }
}
