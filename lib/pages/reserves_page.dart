import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/colors.dart';

import '../model/data_box_model.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Reserves"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: reserve.length,
        itemBuilder: (context, index) {
          return Text(reserve.elementAt(index).stationDistance);
        },
      ),
    );
  }
}
