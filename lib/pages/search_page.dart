import 'package:flutter/material.dart';
import 'package:the_green_whale/pages/home_page.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static String id = "/search";
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double textFactor = MediaQuery.of(context).textScaleFactor;
    // debugPrint((size.height * 0.025).toString());
    return Scaffold(
      backgroundColor: backgroundColor,
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
        title: Text(
          "Search",
          style: titleTextStyle.copyWith(
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            //Search Bar
            SearchBar(
              size: size,
              searchController: searchController,
              textFactor: textFactor,
              tap: () {
                setState(() {
                  FocusManager.instance.primaryFocus?.unfocus();
                  searchController.clear();
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            //Current Location Searched
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.025),
              child: Text(
                "NEAR ${searchController.text.trim().toUpperCase()}",
                style: subtitleTextStyle.copyWith(fontSize: textFactor * 14),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            //DATA BOX
            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025, right: size.height * 0.025),
              child: DataBox(size: size, textFactor: textFactor),
            ),
            SizedBox(height: size.height * 0.025),
            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025, right: size.height * 0.025),
              child: DataBox(size: size, textFactor: textFactor),
            ),
            SizedBox(height: size.height * 0.025),
            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025, right: size.height * 0.025),
              child: DataBox(size: size, textFactor: textFactor),
            ),
            SizedBox(height: size.height * 0.025),
            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025, right: size.height * 0.025),
              child: DataBox(size: size, textFactor: textFactor),
            ),
          ],
        ),
      ),
    );
  }
}


class DataBox extends StatelessWidget {
  const DataBox({
    Key? key,
    required this.size,
    required this.textFactor,
  }) : super(key: key);

  final Size size;
  final double textFactor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.width,
          color: boxColor,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Available Line
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.01,
                        color: greenColor,
                      ),
                    ],
                  ),

                  // Station Name
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.025,
                      left: size.height * 0.025,
                    ),
                    child: Text(
                      "BMW - Auotomag",
                      style: titleTextStyle.copyWith(
                        fontSize: textFactor * 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Station Distance
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.025,
                      right: size.height * 0.025,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/location2.png",
                          height: size.height * 0.025,
                          color: greenColor,
                        ),
                        SizedBox(width: size.width * 0.02),
                        // Distance
                        Text(
                          "1.4 km",
                          style: subtitleTextStyle.copyWith(
                            color: greenColor,
                            fontWeight: FontWeight.w400,
                            fontSize: textFactor * 17.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //Station Locattion
        Positioned(
          top: size.height * 0.07,
          left: size.height * 0.029,
          child: Text(
            "Luebeckertordamm 60, Munich",
            style: subtitleTextStyle.copyWith(
              fontSize: textFactor * 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.1,
          left: size.height * 0.029,
          child: Row(
            children: [
              Image.asset(
                "assets/icons/clock.png",
                height: size.height * 0.025,
              ),
              SizedBox(width: size.height * 0.0125),
              Text(
                "9 am - 10 pm",
                style: subtitleTextStyle.copyWith(
                  fontSize: textFactor * 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.14,
          left: size.height * 0.004,
          child: Container(
            height: 1,
            width: size.width,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: size.height * 0.16,
          left: size.height * 0.029,
          child: Row(
            children: [
              for (int i = 0; i < 3; i++) ...[
                Image.asset(
                  "assets/icons/type1-charger.png",
                  height: size.height * 0.025,
                ),
                i != 3
                    ? SizedBox(
                        width: size.height * 0.015,
                      )
                    : const SizedBox(width: 0),
                Text(
                  "Type 1",
                  style: subtitleTextStyle.copyWith(fontSize: textFactor * 18),
                ),
                i != 3
                    ? SizedBox(
                        width: size.height * 0.02,
                      )
                    : const SizedBox(width: 0),
              ]
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.164,
          right: size.height * 0.029,
          child: Text(
            "22 kw",
            style: subtitleTextStyle.copyWith(
              fontSize: textFactor * 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
    required this.searchController,
    required this.textFactor,
    required this.tap,
  }) : super(key: key);

  final Size size;
  final TextEditingController searchController;
  final double textFactor;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.076,
      color: boxColor,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: size.height * 0.025),
            child: Image.asset(
              "assets/icons/location2.png",
              height: size.height * 0.03,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          SizedBox(
            width: size.width * 0.365,
            child: TextField(
              controller: searchController,
              style: titleTextStyle.copyWith(
                fontSize: textFactor * 17,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: tap,
            child: Container(
              margin: EdgeInsets.only(right: size.height * 0.025),
              child: Image.asset(
                "assets/icons/close.png",
                height: size.height * 0.028,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
