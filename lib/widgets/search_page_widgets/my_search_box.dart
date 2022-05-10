import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../../utils/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
    required this.searchController,
    required this.textFactor,
    required this.tap,
  }) : super(key: key);

  final Size size;
  final TextEditingController searchController;
  final double textFactor;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.076,
      color: boxColor,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: size.height * 0.025),
            child: Image.asset(
              "assets/icons/location2.png",
              height: size.height * 0.03,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          SizedBox(
            width: size.width * 0.365,
            child: TextField(
              controller: searchController,
              style: titleTextStyle.copyWith(
                fontSize: textFactor * 17,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: tap,
            child: Container(
              margin: EdgeInsets.only(right: size.height * 0.025),
              child: Image.asset(
                "assets/icons/close.png",
                height: size.height * 0.028,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
