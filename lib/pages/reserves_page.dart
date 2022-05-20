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
          left: size.height * 0.025,
          right: size.height * 0.025,
        ),
        child: ListView.builder(
          itemCount: reserve.length,
          itemBuilder: (context, index) {
            final item = reserve.elementAt(index);
            return StatefulBuilder(
              builder: (context, setState) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchDetailPage(data: item),
                    ),
                  );
                  setState(() {});
                },
                child: Column(
                  children: [
                    DataBox(
                      size: size,
                      // textFactor: textFactor,
                      stationName: reserve.elementAt(index).stationName,
                      stationDistance: reserve.elementAt(index).stationDistance,
                      stationTime: reserve.elementAt(index).stationTime,
                      stationLocation: reserve.elementAt(index).stationLocation,
                      stationPower: reserve.elementAt(index).stationPower,
                      isAvailable: reserve.elementAt(index).isAvailable,
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
    );
  }
}
