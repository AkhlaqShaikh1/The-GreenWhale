import 'package:flutter/material.dart';
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
          left: size.height * 0.01,
          right: size.height * 0.008,
        ),
        height: size.height * 0.05,
        width: size.width * 0.11,
        child: Container(
          padding: EdgeInsets.only(
            top: size.height * 0.015,
            bottom: size.height * 0.015,
            left: size.height * 0.016,
            right: size.height * 0.018,
          ),
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
              height: size.height * 0.018,
            ),
          ),
        ),
      ),
    );
  }
}
