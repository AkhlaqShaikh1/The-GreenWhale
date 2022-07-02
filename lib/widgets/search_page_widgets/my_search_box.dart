import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../../utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.size,
    required this.searchController,
    required this.textFactor,
    required this.tap,
    required this.submit,
    
  }) : super(key: key);

  final Size size;
  final TextEditingController searchController;
  final double textFactor;
  final VoidCallback tap;
  final VoidCallback submit;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String test = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.076,
      color: boxColor,
      width: widget.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: widget.size.height * 0.025),
            child: Image.asset(
              "assets/icons/location2.png",
              height: widget.size.height * 0.03,
            ),
          ),
          SizedBox(width: widget.size.width * 0.04),
          SizedBox(
            width: widget.size.width * 0.365,
            child: TextField(
              onSubmitted: (value) => widget.submit(),
              onChanged: (value) {
                setState(() {});
              },
              controller: widget.searchController,
              style: titleTextStyle.copyWith(
                fontSize: widget.textFactor * 17,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: widget.tap,
            child: Container(
              margin: EdgeInsets.only(right: widget.size.height * 0.025),
              child: Image.asset(
                "assets/icons/close.png",
                height: widget.size.height * 0.028,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
