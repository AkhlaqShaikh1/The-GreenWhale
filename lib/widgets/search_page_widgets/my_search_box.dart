import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../../utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.searchController,
    required this.tap,
    required this.submit,
  }) : super(key: key);

  final TextEditingController searchController;

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
      height: 170.h,
      color: boxColor,
      width: 1125.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 65.w),
            child: Image.asset(
              "assets/icons/location2.png",
              height: 60.h,
              width: 60.w,
            ),
          ),
          SizedBox(width: 30.w),
          SizedBox(
            width: 800.w,
            child: TextField(
              cursorHeight: 60.sp,
              cursorColor: greenColor,
              onSubmitted: (value) => widget.submit(),
              onChanged: (value) {
                setState(() {});
              },
              controller: widget.searchController,
              style: titleTextStyle.copyWith(
                fontSize: 45.sp,
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
              margin: EdgeInsets.only(right: 68.12.w),
              child: Image.asset(
                "assets/icons/close.png",
                height: 54.h,
                width: 54.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
