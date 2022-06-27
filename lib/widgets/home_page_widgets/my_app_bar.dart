import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:the_green_whale/utils/text_styles.dart';

import '../../pages/search_page.dart';
import 'my_app_bar_icon.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.lat,
    required this.long,
  }) : super(key: key);

  final Size size;
  final double textFactor;
  final double lat;
  final double long;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  // String userName = Auth().getUserName() ?? "Guest";
  late String? userName;

  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<DatabaseService>().name;
    // print(context.read<DatabaseService>().name);
    return SafeArea(
      child: Container(
        height: 300.h,
        width: widget.size.width,
        color: primaryColor,
        child: Row(
          children: [
            MyAppBarIcon(
              size: widget.size,
              imgSrc: "location",
              ontap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.size.height * 0.015),
                  Text(
                    "Welcome",
                    style: subtitleTextStyle.copyWith(
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: widget.size.height * 0.005,
                  ),
                  Text(
                    "Guest",
                    style: titleTextStyle.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                MyAppBarIcon(
                  size: widget.size,
                  imgSrc: "search",
                  ontap: () {
                    Navigator.of(context).pushNamed(SearchPage.id);
                  },
                ),
                MyAppBarIcon(
                  size: widget.size,
                  imgSrc: "list",
                  ontap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
