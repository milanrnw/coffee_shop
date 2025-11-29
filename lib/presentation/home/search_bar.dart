import 'package:coffee_shop/presentation/custom_widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
          child: SearchTextField(),
        ),
        SvgPicture.asset("assets/icons/bell_icon.svg"),
      ],
    );
  }
}
