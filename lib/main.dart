import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_green_whale/authentication/auth.dart';
import 'package:the_green_whale/authentication/login_page.dart';
import 'package:the_green_whale/authentication/signup_page.dart';

import 'package:the_green_whale/pages/main_page.dart';
import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/search_page.dart';
import 'package:the_green_whale/provider/api.dart';
import 'package:the_green_whale/services/database_service.dart';

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
          return MultiProvider(
            providers: [
              Provider<Auth>(
                create: (_) => Auth(firebaseAuth: FirebaseAuth.instance),
              ),
              StreamProvider(
                create: (context) => context.read<Auth>().authState,
                initialData: null,
              ),
              Provider(
                create: (context) => DatabaseService(
                    uid: context.read<Auth>().firebaseAuth.currentUser!.uid),
              ),
            ],
            child: MaterialApp(
              title: 'The Greenwhale',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(brightness: Brightness.dark),
              home: const MainPage(),
              routes: {
                MainPage.id: (context) => const MainPage(),
                SearchPage.id: (context) => const SearchPage(),
                MapPage.id: (context) => const MapPage(),
                LoginPage.id: (context) => LoginPage(),
                SignUpPage.id: (context) => const SignUpPage(),
              },
            ),
          );
        },
      ),
    );
  }
}
