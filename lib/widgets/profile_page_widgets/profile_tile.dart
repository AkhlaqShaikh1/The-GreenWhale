import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.size,
    required this.leadingImgSrc,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String leadingImgSrc;
  final VoidCallback? onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.06,
        width: size.width,
        color: boxColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.02,
          ),
          child: Row(
            children: [
              Image.asset("assets/icons/$leadingImgSrc.png",
                  height: size.height * 0.025),
              SizedBox(width: size.height * 0.009),
              Text(title),
              const Spacer(),
              Image.asset(
                "assets/icons/arrow-down.png",
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
