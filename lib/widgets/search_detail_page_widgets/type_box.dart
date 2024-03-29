import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

// ignore: must_be_immutable
class TypeBox extends StatelessWidget {
  TypeBox({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.isAvailable,
    this.connectors,
    required this.connectorType,
    required this.power,
    required this.price,
  }) : super(key: key);

  final Size size;
  final double textFactor;
  final String isAvailable;

  final List? connectors;
  final String connectorType;
  final String power;
  final String price;
  late String connectorName;

  late bool isAvai;
  late String imgSrc;
  String type1 = "assets/icons/type-1.png";
  String type2 = "assets/icons/type-2.png";
  String chademo = "assets/icons/chademo.png";
  String css = "assets/icons/css.png";

  String available = "AVAILABLE",
      notAvailble = "Not Available",
      unknown = "UNKNOWN",
      busy = "BUSY";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.001, vertical: size.height * 0.01),
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: EdgeInsets.zero,
        dividerColor: primaryColor,
        animationDuration: const Duration(seconds: 1),
        elevation: 0,
        children: [
          ExpansionPanelRadio(
              backgroundColor: boxColor,
              value: "",
              headerBuilder: (context, isOpen) {
                return ListTile(
                  leading: Image.asset(
                    setImageSrc(connectorType),
                    height: size.height * 0.05,
                  ),
                  title: Text(
                    setConnectorText(connectorType),
                    style: titleTextStyle.copyWith(
                      fontSize:
                          50.sp,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        power + " kw",
                        style: subtitleTextStyle.copyWith(fontSize: 35.sp),
                      ),
                      SizedBox(
                        width: size.height * 0.02,
                      ),
                      Container(
                        color: setAvailable(isAvailable),
                        height: size.height * 0.01,
                        width: size.height * 0.01,
                      ),
                      SizedBox(width: size.height * 0.007),
                      Text(
                        checkAvailability(isAvailable)[1],
                        style: titleTextStyle.copyWith(
                          color: setAvailable(isAvailable),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
              body: Column(
                children: [
                  Divider(
                    color: primaryColor,
                    thickness: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.025,
                      vertical: size.height * 0.02,
                    ),
                    width: size.width,
                    child: Row(children: [
                      Text(
                        "Price",
                        style: subtitleTextStyle.copyWith(
                            fontSize: 50.sp),
                      ),
                      const Spacer(),
                      Text(
                        price,
                        style: titleTextStyle.copyWith(
                          color: checkAvailability(isAvailable)[0]
                              ? greenColor
                              : notAvailableColor,
                          fontSize:
                              50.sp,
                        ),
                      )
                    ]),
                  ),
                ],
              )),
        ],
      ),
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

  List checkAvailability(String data) {
    if (data == available) {
      isAvai = true;
      return [isAvai, "Available"];
    }
    isAvai = false;
    return [isAvai, data];
  }

  setAvailable(data) {
    if (data == "AVAILABLE") {
      return greenColor;
    }
    if (data == "UNKNOWN") {
      return subtitleColor;
    } else {
      return notAvailableColor;
    }
  }
}
