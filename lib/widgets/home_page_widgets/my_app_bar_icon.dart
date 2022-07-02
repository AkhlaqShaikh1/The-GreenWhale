import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_green_whale/utils/colors.dart';

class MyAppBarIcon extends StatelessWidget {
  const MyAppBarIcon({
    Key? key,
    required this.size,
    required this.imgSrc,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final String imgSrc;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        height: 130.h,
        width: 130.w,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: subtitleColor,
              style: BorderStyle.solid,
              width: 0.15,
            ),
          ),
          child: Center(
            child: Image.asset(
              "assets/icons/$imgSrc.png",
              color: Colors.white,
              height: 60.h,
              width: 60.w,
            ),
          ),
        ),
      ),
    );
  }
}
