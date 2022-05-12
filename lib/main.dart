import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:the_green_whale/pages/main_page.dart';
import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/search_page.dart';

import 'package:the_green_whale/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Greenwhale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: primaryColor),
      home: const MainPage(),
      routes: {
        MainPage.id: (context) => const MainPage(),
        SearchPage.id: (context) => const SearchPage(),
        MapPage.id: (context) => const MapPage(),
      },
    );
  }
}
