import 'package:flutter/material.dart';

import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../widgets/home_page_widgets/my_app_bar_icon.dart';

class SearchDetailPage extends StatelessWidget {
  SearchDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataBoxModel data;

  static String imgPath = "assets/icons/arrow-down-small.png";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leadingWidth: 60,
        leading: Container(
          margin: EdgeInsets.only(
            top: size.height * 0.015,
          ),
          child: MyAppBarIcon(
            size: size,
            imgSrc: "back",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.height * 0.007),
            child: MyAppBarIcon(
              imgSrc: "heart",
              size: size,
              ontap: () {
                bool notInFav = true;
                for (int i = 0; i < fav.length; i++) {
                  if (fav[i].stationName == data.stationName) {
                    notInFav = false;
                    break;
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      !notInFav
                          ? "Already In Favorites"
                          : "Added to Favourites",
                      style: titleTextStyle.copyWith(color: subtitleColor),
                    ),
                    backgroundColor: primaryColor,
                  ),
                );
                notInFav ? fav.add(data) : null;
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              // Map
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: size.width,
                    color: Colors.amber,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.017,
                  vertical: size.height * 0.02,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.stationName,
                        style: titleTextStyle.copyWith(fontSize: textFactor * 28),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        data.stationLocation,
                        style:
                            subtitleTextStyle.copyWith(fontSize: textFactor * 24),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TimeBox(
                            size: size,
                            textFactor: textFactor,
                            imgSrc: "clock",
                            status: "Open",
                            title: "24 h",
                          ),
                          TimeBox(
                            size: size,
                            textFactor: textFactor,
                            imgSrc: "location",
                            status: "Far",
                            title: "24 km",
                          ),
                          TimeBox(
                            size: size,
                            textFactor: textFactor,
                            imgSrc: "public",
                            status: "Far",
                            title: "Public",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        "Charging Plugs",
                        style: titleTextStyle.copyWith(fontSize: textFactor * 30),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Pick One To Start Charging",
                        style:
                            subtitleTextStyle.copyWith(fontSize: textFactor * 25),
                      ),
                      SizedBox(height: size.height * 0.02),
                      StatefulBuilder(
                        builder: (context, setState) => GestureDetector(
                          onTap: () {
                            if (imgPath == "assets/icons/arrow-down-small.png") {
                              imgPath = "assets/icons/arrow-up-small.png";
                            } else {
                              imgPath = "assets/icons/arrow-down-small.png";
                            }
                            setState(() {});
                          },
                          child: TypeBox(
                            size: size,
                            textFactor: textFactor,
                            imgPath: imgPath,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeBox extends StatelessWidget {
  TypeBox({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.imgPath,
  }) : super(key: key);

  final Size size;
  final double textFactor;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: boxColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/type-1.png",
            height: 40,
          ),
          SizedBox(width: size.height * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Type 1",
                style: titleTextStyle.copyWith(
                  fontSize: textFactor * 25,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "22 kw",
                    style: subtitleTextStyle,
                  ),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Container(
                    color: notAvailableColor,
                    height: 5,
                    width: 5,
                  ),
                  SizedBox(width: size.height * 0.007),
                  Text(
                    "Not Available",
                    style: titleTextStyle.copyWith(
                      color: notAvailableColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            imgPath,
            height: 15,
          ),
        ],
      ),
    );
  }
}

class TimeBox extends StatelessWidget {
  const TimeBox({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.imgSrc,
    required this.title,
    required this.status,
  }) : super(key: key);

  final Size size;
  final double textFactor;
  final String imgSrc;
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            width: size.width * 0.25,
            height: size.height * 0.08,
            padding: EdgeInsets.all(size.height * 0.01),
            color: boxColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.008,
                      top: size.height * 0.012,
                      bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/$imgSrc.png",
                        color: Colors.white,
                        height: 15,
                      ),
                      SizedBox(
                        width: size.height * 0.015,
                      ),
                      Text(
                        title,
                        style:
                            titleTextStyle.copyWith(fontSize: textFactor * 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: size.height * 0.003,
                  ),
                  child: Text(
                    status,
                    style: subtitleTextStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
