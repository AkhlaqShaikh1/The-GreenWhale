import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class TypeBox extends StatelessWidget {
  const TypeBox({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.imgPath,
  }) : super(key: key);

  final Size size;
  final double textFactor;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: boxColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/type-1.png",
            height: 40,
          ),
          SizedBox(width: size.height * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Type 1",
                style: titleTextStyle.copyWith(
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "22 kw",
                    style: subtitleTextStyle,
                  ),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Container(
                    color: notAvailableColor,
                    height: 5,
                    width: 5,
                  ),
                  SizedBox(width: size.height * 0.007),
                  Text(
                    "Not Available",
                    style: titleTextStyle.copyWith(
                      color: notAvailableColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            imgPath,
            height: 15,
          ),
        ],
      ),
    );
  }
}
