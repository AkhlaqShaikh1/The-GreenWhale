import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/colors.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Favourites"),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
