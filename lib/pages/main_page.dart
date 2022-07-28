import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_green_whale/pages/favourite_page.dart';
import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/profile_page.dart';
import 'package:the_green_whale/pages/reserves_page.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static String id = "/home";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  Color selectedColor = greenColor;
  Color unSelectedColor = subtitleColor;

  List pages = const [
    MapPage(),
    FavouritePage(),
    ReservePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 260.h,
        width: size.width,
        decoration: BoxDecoration(color: primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 200.w,
              child: InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: _buildIcon("map", "Map", 0, size),
              ),
            ),
            SizedBox(
              width: 235.w,
              child: InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: _buildIcon("heart", "Favourite", 1, size),
              ),
            ),
            SizedBox(
              width: 230.w,
              child: InkWell(
                splashColor: greenColor,
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => SizedBox(
                          height: 985.w,
                          width: 995.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AlertDialog(
                                // contentPadding: EdgeInsets.zero,
                                actionsPadding: const EdgeInsets.all(0),

                                backgroundColor: Colors.white,
                                content: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              " Earn money by helping us. Reserve your spot to connect your electric vehicle!",
                                          style: subtitleTextStyle.copyWith(
                                            fontSize: 35.sp,
                                          ),
                                        )
                                      ],
                                      style: titleTextStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                      ),
                                      text:
                                          "There are peak prices coming today!\n"),
                                ),
                                title: Image.asset(
                                  "assets/icons/price high.png",
                                  height: 270.h,
                                  width: 300.w,
                                ),
                                actions: [
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const ReservePage(),
                                    )),
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: greenColor,
                                      width: 995.w,
                                      height: 160.h,
                                      child: Text(
                                        "Reserve Now",
                                        style: titleTextStyle.copyWith(
                                            fontSize: 50.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(),
                                  ),
                                ),
                                child: Container(
                                  width: 160.w,
                                  height: 160.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset("assets/icons/cancel.png",
                                      height: 120.h, width: 120.w),
                                ),
                              )
                            ],
                          )));
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: _buildIcon("clock", "Reserves", 2, size),
              ),
            ),
            SizedBox(
              width: 220.w,
              child: InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                child: _buildIcon("profile-circle", "Profile", 3, size),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String imgSrc, String title, index, size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/$imgSrc.png",
          color: index == pageIndex ? selectedColor : unSelectedColor,
          height: 50.h,
          width: 50.w,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style:
                titleTextStyle.copyWith(color: Colors.white, fontSize: 35.sp),
          ),
        ),
      ],
    );
  }
}
