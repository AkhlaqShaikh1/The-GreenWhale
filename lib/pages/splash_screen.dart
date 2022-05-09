import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/cloud1.png",
                height: size.height * 0.04,
                width: size.width * 0.18,
              ),
              const Spacer(),
              Image.asset(
                "assets/images/cloud2.png",
                height: size.height * 0.12,
                width: size.width * 0.2,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Center(
            child: Image.asset(
              "assets/images/cloud3.png",
              height: 50,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Center(
            child: SvgPicture.asset(
              "assets/images/whale.svg",
              height: size.height * 0.09,
              width: size.width * 0.4,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          RichText(
            text: TextSpan(
              text: "THE",
              style: titleTextStyle,
              children: [
                TextSpan(
                  text: " GREENWHALE",
                  style: titleTextStyle.copyWith(
                      color: greenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).textScaleFactor * 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
