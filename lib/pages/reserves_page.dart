import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/colors.dart';

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
    );
  }
}
