import 'package:flutter/material.dart';
import 'package:the_green_whale/pages/search_page.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          CustomAppBar(size: size, textFactor: textFactor),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
    required this.textFactor,
  }) : super(key: key);

  final Size size;
  final double textFactor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: size.height * 0.09,
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
                  imgSrc: "menu",
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
            borderRadius: BorderRadius.circular(80),
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
