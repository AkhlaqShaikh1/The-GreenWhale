import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar_icon.dart';


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
        onTap: () {
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
      body: Padding(
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
              color: Colors.amber,
              height: size.height * 0.35,
            ),
          ],
        ),
      ),
    );
  }
}

class SetTimeBox extends StatefulWidget {
  const SetTimeBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SetTimeBox> createState() => _SetTimeBoxState();
}

class _SetTimeBoxState extends State<SetTimeBox> {
  DateTime _chosen = DateTime.now();
  String format = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (_) {
              return SizedBox(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                          backgroundColor: Colors.white,
                          mode: CupertinoDatePickerMode.time,
                          initialDateTime: DateTime.now(),
                          use24hFormat: true,
                          onDateTimeChanged: (value) {
                            _chosen = value;
                            setState(() {
                              format = DateFormat.Hm().format(_chosen);
                            });
                          }),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        width: widget.size.width,
        padding: EdgeInsets.symmetric(
            horizontal: widget.size.height * 0.02, vertical: 12),
        color: boxColor,
        child: Row(
          children: [
            Text(
              format,
              style: titleTextStyle.copyWith(
                fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Image.asset(
              "assets/icons/clock.png",
              height: 15,
              color: greenColor,
            ),
          ],
        ),
      ),
    );
  }
}
