import 'package:flutter/material.dart';
import 'package:the_green_whale/pages/search_detail_page.dart';
import 'package:the_green_whale/utils/colors.dart';

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
      body: Padding(
        padding: EdgeInsets.only(
            left: size.height * 0.025, right: size.height * 0.025),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: reserve.length,
          itemBuilder: (context, index) {
            final item = reserve.elementAt(index);
            return StatefulBuilder(builder: (context, setState) {
              return GestureDetector(
                onTap: () => MaterialPageRoute(
                  builder: (ctx) => SearchDetailPage(data: item),
                ),
                child: Column(
                  children: [
                    DataBox(
                      size: size,
                      // textFactor: textFactor,
                      stationName: fav.elementAt(index).stationName,
                      stationDistance: fav.elementAt(index).stationDistance,
                      stationTime: fav.elementAt(index).stationTime,
                      stationLocation: fav.elementAt(index).stationLocation,
                      stationPower: fav.elementAt(index).stationPower,
                      isAvailable: fav.elementAt(index).isAvailable,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    )
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
