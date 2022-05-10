import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class DataBox extends StatelessWidget {
  const DataBox({
    Key? key,
    required this.size,
    required this.textFactor,
  }) : super(key: key);

  final Size size;
  final double textFactor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.width,
          color: boxColor,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Available Line
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.01,
                        color: greenColor,
                      ),
                    ],
                  ),

                  // Station Name
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.025,
                      left: size.height * 0.025,
                    ),
                    child: Text(
                      "BMW - Auotomag",
                      style: titleTextStyle.copyWith(
                        fontSize: textFactor * 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Station Distance
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.025,
                      right: size.height * 0.025,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/location2.png",
                          height: size.height * 0.025,
                          color: greenColor,
                        ),
                        SizedBox(width: size.width * 0.02),
                        // Distance
                        Text(
                          "1.4 km",
                          style: subtitleTextStyle.copyWith(
                            color: greenColor,
                            fontWeight: FontWeight.w400,
                            fontSize: textFactor * 17.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //Station Locattion
        Positioned(
          top: size.height * 0.07,
          left: size.height * 0.029,
          child: Text(
            "Luebeckertordamm 60, Munich",
            style: subtitleTextStyle.copyWith(
              fontSize: textFactor * 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.1,
          left: size.height * 0.029,
          child: Row(
            children: [
              Image.asset(
                "assets/icons/clock.png",
                height: size.height * 0.025,
              ),
              SizedBox(width: size.height * 0.0125),
              Text(
                "9 am - 10 pm",
                style: subtitleTextStyle.copyWith(
                  fontSize: textFactor * 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.14,
          left: size.height * 0.004,
          child: Container(
            height: 1,
            width: size.width,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: size.height * 0.16,
          left: size.height * 0.029,
          child: Row(
            children: [
              // Will change this according to the API logic
              for (int i = 0; i < 3; i++) ...[
                Image.asset(
                  "assets/icons/type1-charger.png",
                  height: size.height * 0.025,
                ),
                i != 3
                    ? SizedBox(
                        width: size.height * 0.015,
                      )
                    : const SizedBox(width: 0),
                Text(
                  "Type 1",
                  style: subtitleTextStyle.copyWith(fontSize: textFactor * 18),
                ),
                i != 3
                    ? SizedBox(
                        width: size.height * 0.02,
                      )
                    : const SizedBox(width: 0),
              ]
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.164,
          right: size.height * 0.029,
          child: Text(
            "22 kw",
            style: subtitleTextStyle.copyWith(
              fontSize: textFactor * 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
