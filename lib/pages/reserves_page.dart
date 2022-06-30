import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:the_green_whale/pages/search_detail_page.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../model/data_box_model.dart';
import '../widgets/search_page_widgets/data_box.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Reserves"),
        centerTitle: true,
        elevation: 0,
      ),
      body: reserve.isEmpty
          ? Center(
              child: Text(
                "No Reserves",
                style: titleTextStyle.copyWith(fontSize: 60.sp),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  right: size.height * 0.025,
                ),
                child: ListView.builder(
                  itemCount: reserve.length,
                  itemBuilder: (context, index) {
                    final item = reserve.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchDetailPage(data: item),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          DataBox(
                            size: size,
                            stationName: item['name'],
                            stationLocation:
                                item['address'] + " ," + item['country_code'],
                            connectors: item['evses'],
                            stationPower: item['evses'][0]['connectors'][0]
                                ['power'],
                            stationDistance: item['location']['coordinates'],
                            stationTime: item['opening_times']['regular_hours'],
                            isAvailable: item['evses'][0]['status'],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                ),
              ),
            ),
    );
  }
}
