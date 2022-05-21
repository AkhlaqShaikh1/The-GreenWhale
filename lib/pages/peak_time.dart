import 'package:flutter/material.dart';

import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar_icon.dart';

class PeakTimePage extends StatelessWidget {
  const PeakTimePage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataBoxModel data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        shadowColor: subtitleColor.withOpacity(0.3),
        backgroundColor: primaryColor,
        elevation: 1.1,
        leading: MyAppBarIcon(
          size: size,
          imgSrc: "back",
          ontap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.009),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.only(top: size.height * 0.01),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: greenColor),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.008),
                    height: size.height * 0.01,
                    width: size.height * 0.01,
                    color: notAvailableColor,
                  ),
                  SizedBox(width: size.height * 0.01),
                  Text(
                    "Electricity Peak Time",
                    style: titleTextStyle.copyWith(
                      color: notAvailableColor,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.008),
                    height: size.height * 0.01,
                    width: size.height * 0.01,
                    color: greenColor,
                  ),
                  SizedBox(width: size.height * 0.01),
                  Text(
                    "Charging Hours",
                    style: titleTextStyle.copyWith(
                      color: greenColor,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(top: size.height * 0.004),
                  height: size.height * 0.01,
                  width: size.height * 0.01,
                  color: const Color(0xffc8f1d4),
                ),
                SizedBox(width: size.height * 0.01),
                Text(
                  "Vehicle-to-Grid",
                  style: titleTextStyle.copyWith(
                    color: const Color(0xffc8f1d4),
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show Peak Time Hours",
                    style: subtitleTextStyle.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.headline5!.fontSize),
                  ),
                  SizedBox(
                    width: size.height * 0.01,
                  ),
                  Image.asset(
                    "assets/icons/arrow up white.png",
                    height: size.height * 0.025,
                    color: subtitleColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
