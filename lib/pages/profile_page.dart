import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_green_whale/authentication/login_page.dart';
import 'package:the_green_whale/pages/main_page.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/profile_page_widgets/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, MainPage.id),
                  child: Container(
                    height: size.height * 0.258,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/start-charging.png"),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.02,
                        vertical: size.height * 0.07,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start".toUpperCase(),
                            style: titleTextStyle.copyWith(
                              fontSize: 45.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Charging".toUpperCase(),
                            style: titleTextStyle.copyWith(
                              fontSize: 45.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/icons/button.png",
                            height: 80.h,
                            width: 80.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ProfileTile(
                  size: size,
                  leadingImgSrc: "login",
                  title: "Log In",
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginPage.id);
                  },
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
