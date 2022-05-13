import 'package:flutter/material.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/start-charging.png"),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.02,
                      vertical: size.height * 0.04,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start".toUpperCase(),
                          style: titleTextStyle.copyWith(
                            fontSize: textFactor * 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Charging".toUpperCase(),
                          style: titleTextStyle.copyWith(
                            fontSize: textFactor * 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/icons/button.png",
                          height: size.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "login",
                  title: "Log In",
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Account".toUpperCase(),
                  style: subtitleTextStyle,
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "profile-circle",
                  title: "Account Management",
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "payment",
                  title: "Payment Methods",
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "chargin",
                  title: "Charging Tags",
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "reservation",
                  title: "Manage reservation of Chargers",
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Account".toUpperCase(),
                  style: subtitleTextStyle,
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "guides",
                  title: "Guides",
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "faq",
                  title: "FAQ",
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "support",
                  title: "Customer Support",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.size,
    required this.leadingImgSrc,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String leadingImgSrc;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}