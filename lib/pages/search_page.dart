import 'package:flutter/material.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar_icon.dart';
import 'package:the_green_whale/widgets/search_page_widgets/data_box.dart';
import 'package:the_green_whale/widgets/search_page_widgets/my_search_box.dart';

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
            SizedBox(height: size.height * 0.04),
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

            //DATA BOXES: PS will be converted into a listView.builder
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
