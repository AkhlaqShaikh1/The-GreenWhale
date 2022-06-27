import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

// ignore: must_be_immutable
class DataBox extends StatelessWidget {
  DataBox({
    Key? key,
    required this.size,
    required this.stationName,
    this.stationDistance = "1.4 km",
    this.stationTime = "10",
    required this.stationLocation,
    this.stationPower = 12,
    this.isAvailable = true,
    this.connectors,
  }) : super(key: key);

  final Size size;
  // final double textFactor;
  final String stationName;
  final String? stationDistance;
  final String? stationTime;
  final String stationLocation;
  final dynamic stationPower;
  final bool isAvailable;
  final List? connectors;

  String type1 = "assets/icons/type-1.png";
  String type2 = "assets/icons/type-2.png";
  String css = "assets/icons/css.png";
  String chademo = "assets/icons/chademo.png";
  String imgSrc = '';
  late String connectorName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 405.h,
          width: 995.w,
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
                        height: 405.h,
                        width: 10.w,
                        color: isAvailable ? greenColor : notAvailableColor,
                      ),
                    ],
                  ),

                  // Station Name
                  Padding(
                    padding: EdgeInsets.only(
                      top: 50.h,
                      left: 50.h,
                    ),
                    child: SizedBox(
                      width: 450.w,
                      child: Text(
                        stationName,
                        // softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: titleTextStyle.copyWith(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Station Distance
                  Padding(
                    padding: EdgeInsets.only(
                      top: 59.h,
                      right: 59.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/location2.png",
                          height: 50.h,
                          width: 50.w,
                          color: greenColor,
                        ),

                        // Distance
                        Text(
                          stationDistance!,
                          softWrap: true,
                          style: subtitleTextStyle.copyWith(
                            color: greenColor,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w400,
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
          top: 121.h,
          left: 60.w,
          child: Text(
            stationLocation,
            style: subtitleTextStyle.copyWith(
              fontSize: 35.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 183.h,
            right: size.height * 0.029,
            left: 60.w,
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/clock.png",
                height: 50.h,
                width: 50.w,
              ),
              SizedBox(width: size.height * 0.0125),
              Text(
                stationTime!,
                style: subtitleTextStyle.copyWith(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // Divider
        Positioned(
          top: 270.h,
          left: 10.w,
          child: Container(
            height: 1,
            width: size.width,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 25),

        Positioned(
          top: 314.h,
          left: 57.w,
          width: 995.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i < connectors!.length; i++) ...[
                Row(
                  children: [
                    Image.asset(
                      setImageSrc(connectors![i]['connectors'][0]['standard']),
                      height: 50.h,
                      width: 40.13.w,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      setConnectorText(
                          connectors![0]['connectors'][0]['standard']),
                      // "TEST",
                      style: subtitleTextStyle.copyWith(
                        fontSize: 35.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 64.w,
                ),
              ]

              // i != 3
              //     ? SizedBox(
              //         width: size.height * 0.01,
              //       )
              //     : const SizedBox(width: 0),
            ]),
          ),
        ),
        Positioned(
          right: 50.w,
          top: 183.h,
          left: 845.w,
          child: Text(
            stationPower.toString() + " kw",
            style: subtitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: 35.sp,
            ),
          ),
        )
      ],
    );
  }

  setConnectorText(String data) {
    if (data.contains("T1")) {
      connectorName = "Type-1";
      return connectorName;
    }
    if (data.contains("T2")) {
      connectorName = "Type-2";
      return connectorName;
    }
    if (data.contains("CHADEMO")) {
      connectorName = "CHADEMO";
      return connectorName;
    }

    connectorName = data;
    return connectorName;
  }

  setImageSrc(String data) {
    if (data.contains("T1")) {
      imgSrc = type1;
      return imgSrc;
    }
    if (data.contains("T2")) {
      imgSrc = type2;
      return imgSrc;
    }
    if (data.contains("CHADEMO")) {
      imgSrc = chademo;
      return imgSrc;
    }

    imgSrc = css;
    return imgSrc;
  }
}
