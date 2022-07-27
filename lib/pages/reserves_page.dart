import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:the_green_whale/pages/search_detail_page.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../model/data_box_model.dart';
import '../widgets/reserve_page_widgets/set_time_box.dart';


class ReservePage extends StatelessWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        
        elevation: 1.5,
        shadowColor: subtitleColor.withOpacity(0.5),
        title: const Text("Reserve Your V2G Spot"),
        centerTitle: true,
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 400),
              backgroundColor: primaryColor,
              content: Text(
                "Added to Reserves",
                style: titleTextStyle.copyWith(color: subtitleColor),
              ),
            ),
          );
          // reserve.add(data);
        },
        child: Container(
          height: size.height * 0.08,
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
                  width: size.width,
                  height: size.height * 0.33,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/images/temp-clock1.png")),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                children: [
                  InkWell(
                    splashColor: subtitleColor.withOpacity(0.5),
                    // onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (ctx) => PeakTimePage(data: data),
                    //     ),
                    //   );
                    // },
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
    // return Scaffold(
    //   backgroundColor: primaryColor,
    //   appBar: AppBar(
    //     backgroundColor: primaryColor,
    //     title: const Text("Reserves"),
    //     centerTitle: true,
    //     elevation: 0,
    //   ),
    //   body: reserve.isEmpty
    //       ? Center(
    //           child: Text(
    //             "No Reserves",
    //             style: titleTextStyle.copyWith(fontSize: 60.sp),
    //           ),
    //         )
    //       : SingleChildScrollView(
    //           child: Padding(
    //             padding: EdgeInsets.only(
    //               left: size.height * 0.025,
    //               right: size.height * 0.025,
    //             ),
    //             child: ListView.builder(
    //               itemCount: reserve.length,
    //               itemBuilder: (context, index) {
    //                 final item = reserve.elementAt(index);
    //                 return GestureDetector(
    //                   onTap: () {
    //                     Navigator.of(context).push(
    //                       MaterialPageRoute(
    //                         builder: (context) => SearchDetailPage(data: item),
    //                       ),
    //                     );
    //                   },
    //                   child: Column(
    //                     children: [
    //                       DataBox(
    //                         size: size,
    //                         stationName: item['name'],
    //                         stationLocation:
    //                             item['address'] + " ," + item['country_code'],
    //                         connectors: item['evses'],
    //                         stationPower: item['evses'][0]['connectors'][0]
    //                             ['power'],
    //                         stationDistance: item['location']['coordinates'],
    //                         stationTime: item['opening_times']['regular_hours'],
    //                         isAvailable: item['evses'][0]['status'],
    //                       ),
    //                       SizedBox(
    //                         height: size.height * 0.02,
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //               shrinkWrap: true,
    //             ),
    //           ),
    //         ),
    // );
  }
}
