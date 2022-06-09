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
    // double textFactor = MediaQuery.of(context).textScaleFactor;

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
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.025, right: size.height * 0.025),
                child: ListView.builder(
                  itemCount: fav.length,
                  itemBuilder: (context, index) {
                    final item = fav.elementAt(index);
                    return StatefulBuilder(
                      builder: (context, setState) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchDetailPage(data: item),
                            ),
                          );
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            DataBox(
                              size: size,
                              // textFactor: textFactor,
                              stationName: fav.elementAt(index).stationName,
                              stationDistance:
                                  fav.elementAt(index).stationDistance,
                              stationTime: fav.elementAt(index).stationTime,
                              stationLocation:
                                  fav.elementAt(index).stationLocation,
                              stationPower: fav.elementAt(index).stationPower,
                              isAvailable: fav.elementAt(index).isAvailable,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
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
