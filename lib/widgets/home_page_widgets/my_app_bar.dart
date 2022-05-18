import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../../pages/search_page.dart';
import 'my_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
    required this.textFactor,
  }) : super(key: key);

  final Size size;
  final double textFactor;

  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: size.height * 0.1,
        width: size.width,
        color: primaryColor,
        child: Row(
          children: [
            MyAppBarIcon(
              size: size,
              imgSrc: "location",
              ontap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.008),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.015),
                  Text(
                    "Good Morning",
                    style: subtitleTextStyle.copyWith(
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    "Janas Fischer",
                    style: titleTextStyle.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                MyAppBarIcon(
                  size: size,
                  imgSrc: "search",
                  ontap: () {
                    Navigator.of(context).pushNamed(SearchPage.id);
                  },
                ),
                MyAppBarIcon(
                  size: size,
                  imgSrc: "list",
                  ontap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
