import 'package:flutter/material.dart';

import 'package:the_green_whale/utils/colors.dart';

import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar.dart';

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
