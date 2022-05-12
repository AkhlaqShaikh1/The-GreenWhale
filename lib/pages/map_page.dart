import 'package:flutter/material.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar.dart';

import '../utils/colors.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);
  static String id = "/map";
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
