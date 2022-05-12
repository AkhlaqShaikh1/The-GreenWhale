import 'package:flutter/material.dart';
import 'package:the_green_whale/pages/favourite_page.dart';
import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/profile_page.dart';
import 'package:the_green_whale/pages/reserves_page.dart';

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
    // double textFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: size.width,
        decoration: BoxDecoration(color: primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: _buildIcon("map", "Map", 0, size),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: _buildIcon("heart", "Favourite", 1, size),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: _buildIcon("clock", "Reserves", 2, size),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: _buildIcon("profile-circle", "Profile", 3, size),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildIcon(String imgSrc, String title, index, size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/$imgSrc.png",
          color: index == pageIndex ? selectedColor : unSelectedColor,
          height: size.height * 0.02,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ],
    );
  }
}
