import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:the_green_whale/authentication/login_page.dart';
import 'package:the_green_whale/authentication/signup_page.dart';

import 'package:the_green_whale/pages/main_page.dart';
import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/search_page.dart';
import 'package:the_green_whale/provider/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ScreenUtil.ensureScreenSize();
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
    return GraphQLProvider(
      client: Api.client,
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(1125, 2436),
        builder: (context, _) {
          return MaterialApp(
            title: 'The Greenwhale',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(brightness: Brightness.dark),
            home: const MainPage(),
            routes: {
              MainPage.id: (context) => const MainPage(),
              SearchPage.id: (context) => const SearchPage(),
              MapPage.id: (context) => const MapPage(),
              LoginPage.id: (context) => const LoginPage(),
              SignUpPage.id: (context) => const SignUpPage(),
            },
          );
        },
      ),
    );
  }
}
