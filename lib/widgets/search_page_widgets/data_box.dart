import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_green_whale/pages/map_page.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'dart:math' show cos, sqrt, asin;

// ignore: must_be_immutable
class DataBox extends StatelessWidget {
  DataBox({
    Key? key,
    required this.size,
    required this.stationName,
    required this.stationDistance,
    required this.stationTime,
    required this.stationLocation,
    required this.stationPower,
    required this.isAvailable,
    required this.connectors,
  }) : super(key: key);

  final Size size;
  final String stationName;
  final List stationDistance;
  final List stationTime;
  final String stationLocation;
  final dynamic stationPower;
  final String isAvailable;
  final List connectors;

  String type1 = "assets/icons/type-1.png";
  String type2 = "assets/icons/type-2.png";
  String css = "assets/icons/css.png";
  String chademo = "assets/icons/chademo.png";
  late String imgSrc;
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
                        color: isAvailable == "AVAILABLE"
                            ? greenColor
                            : notAvailableColor,
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
                        SizedBox(
                          width: 20.sp,
                        ),

                        // Distance
                        Text(
                          setDistance(
                                MapPage.lat.toDouble(),
                                MapPage.long.toDouble(),
                                stationDistance[1],
                                stationDistance[0],
                              ).toString().substring(0, 6) +
                              " km",
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
                setTime(stationTime),
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
              for (int i = 0; i < connectors.length; i++) ...[
                Row(
                  children: [
                    Image.asset(
                      setImageSrc(connectors[i]['connectors'][0]['standard']),
                      height: 50.h,
                      width: 40.13.w,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      setConnectorText(
                          connectors[i]['connectors'][0]['standard']),
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
                i == connectors.length
                    ? SizedBox(
                        width: 35.sp,
                      )
                    : SizedBox(width: 0.sp),
              ]
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

  double setDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  setTime(data) {
    if (data.isEmpty) {
      return "24 hrs Open";
    }
    if (data[0]['period_begin'] == null || data[0]['period_end'] == null) {
      return "No time data Available";
    }

    return data[0]['period_begin'] + " - " + data[0]['period_end'];
  }
}
