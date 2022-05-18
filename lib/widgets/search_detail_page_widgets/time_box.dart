import 'package:flutter/material.dart';

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
        Container(
          padding: EdgeInsets.only(
            top: size.height * 0.01,
            left: size.height * 0.01,
            bottom: size.height * 0.02,
            right: size.height * 0.02,
          ),
          color: boxColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.008,
                  top: size.height * 0.012,
                  bottom: size.height * 0.01,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/$imgSrc.png",
                      color: Colors.white,
                      height: size.height * 0.028,
                    ),
                    SizedBox(
                      width: size.height * 0.015,
                    ),
                    Text(
                      title,
                      style: titleTextStyle.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.height * 0.005,
                ),
                child: Text(
                  status,
                  style: subtitleTextStyle,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
