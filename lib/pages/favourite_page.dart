import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/pages/search_detail_page.dart';
import 'package:the_green_whale/utils/colors.dart';

import '../utils/text_styles.dart';
import '../widgets/search_page_widgets/data_box.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Favourites"),
        centerTitle: true,
        elevation: 0,
      ),
      body: fav.isEmpty
          ? Center(
              child: Text(
                "No Favourites",
                style: titleTextStyle.copyWith(fontSize: 60.sp),
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                padding: EdgeInsets.only(
                    left: size.height * 0.025, right: size.height * 0.025),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: fav.length,
                itemBuilder: (context, index) {
                  final item = fav.elementAt(index);
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
                          isAvailable: item['evses'][index]['status'],
                          size: size,
                          stationName: item['name'],
                          stationLocation:
                              item['address'] + " ," + item['country_code'],
                          connectors: item['evses'],
                          stationPower: item['evses'][0]['connectors'][0]
                              ['power'],
                          stationDistance: item['location']['coordinates'],
                          stationTime: item['opening_times']['regular_hours'],
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
    );
  }
}
