import 'package:flutter/material.dart';

import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/pages/reserve_spot.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/search_detail_page_widgets/time_box.dart';

import '../widgets/home_page_widgets/my_app_bar_icon.dart';
import '../widgets/search_detail_page_widgets/type_box.dart';

class SearchDetailPage extends StatelessWidget {
  const SearchDetailPage({
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
              top: size.height * 0.015, bottom: size.height * 0.003),
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
                    duration: const Duration(milliseconds: 800),
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
                  SizedBox(
                    width: size.width,
                    child: Image.asset("assets/images/map-image2.png"),
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
                        style: titleTextStyle.copyWith(
                          fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .fontSize! +
                              10,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        data.stationLocation,
                        style: subtitleTextStyle.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.subtitle2!.fontSize! +
                                  5,
                        ),
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
                        style: titleTextStyle.copyWith(
                          fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .fontSize! +
                              10,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Pick One To Start Charging",
                        style: subtitleTextStyle.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.subtitle2!.fontSize! +
                                  5,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      StatefulBuilder(
                        builder: (context, setState) => GestureDetector(
                          onTap: () {
                            if (imgPath ==
                                "assets/icons/arrow-down-small.png") {
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
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReserveSpotPage(data: data),
                  ),
                ),
                child: Text(
                  "Reserve Spot",
                  style: titleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
