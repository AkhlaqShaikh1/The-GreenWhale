import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class TimeBox extends StatelessWidget {
  const TimeBox({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.imgSrc,
    required this.title,
    required this.status,
  }) : super(key: key);

  final Size size;
  final double textFactor;
  final String imgSrc;
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(
          child: Container(
            width: 305.w,
            height: 190.h,
            padding: EdgeInsets.only(left: 38.w, top: 39.h),
            color: boxColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/$imgSrc.png",
                      color: Colors.white,
                      height: 60.h,
                      width: 60.w,
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: titleTextStyle.copyWith(
                          fontSize: 45.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: size.height * 0.005,
                  ),
                  child: Text(
                    status,
                    style: subtitleTextStyle.copyWith(fontSize: 35.sp),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
