import 'package:flutter/material.dart';

import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/pages/peak_time.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar_icon.dart';

import '../widgets/reserve_page_widgets/set_time_box.dart';

class ReserveSpotPage extends StatelessWidget {
  const ReserveSpotPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataBoxModel data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leadingWidth: 60,
        leading: Container(
          margin: EdgeInsets.only(
              top: size.height * 0.012, bottom: size.height * 0.003),
          child: MyAppBarIcon(
            size: size,
            imgSrc: "back",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        elevation: 1.5,
        shadowColor: subtitleColor.withOpacity(0.5),
        title: const Text("Reserve Your V2G Spot"),
        centerTitle: true,
      ),
      bottomNavigationBar: InkWell(
        // onTap: () {},
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 400),
              backgroundColor: primaryColor,
              content: Text(
                reserve.contains(data)
                    ? "Already In Your Reserves"
                    : "Added to Reserves",
                // textAlign: TextAlign.center,
                style: titleTextStyle.copyWith(color: subtitleColor),
              ),
            ),
          );
          reserve.add(data);
        },
        child: Container(
          height: size.height * 0.1,
          width: size.width,
          color: greenColor,
          child: Center(
            child: Text(
              "Reserve My Spot",
              style: titleTextStyle.copyWith(
                fontSize: Theme.of(context).textTheme.headline5!.fontSize,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.height * 0.02, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "When Do You Want To Connect Your EV?",
                style: subtitleTextStyle.copyWith(
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              // Set Time Box
              SetTimeBox(size: size),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "When Do You Need Your EV?",
                style: subtitleTextStyle.copyWith(
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SetTimeBox(size: size),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "What will be the percentage of your EV in the end?",
                style: subtitleTextStyle.copyWith(
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.02, vertical: 12),
                color: boxColor,
                child: Text(
                  "90%",
                  style: titleTextStyle.copyWith(
                    fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.33,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                children: [
                  InkWell(
                    splashColor: subtitleColor.withOpacity(0.5),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => PeakTimePage(data: data),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(
                        "assets/icons/arrow up white.png",
                        height: size.height * 0.02,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/icons/question.png",
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
