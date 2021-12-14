import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'intro_screen.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Future<void> main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Roboto',
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF6667AB)),
      primaryColor: const Color(0xFFf8f8f8),
      canvasColor: const Color(0xffFFFFFF),
      unselectedWidgetColor: const Color(0xFF6667AB),
      toggleableActiveColor: const Color(0xFF6667AB),
      indicatorColor: const Color(0xFF6667AB),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFFf9f9f9),
        iconTheme: IconThemeData(color: Color(0xffa1a1a1)),
        titleTextStyle: (TextStyle(
            color: Color(0xFF2F2F2F),
            fontWeight: FontWeight.normal,
            fontSize: 20,
            fontFeatures: [
              FontFeature.enable('pnum'),
              FontFeature.enable('lnum')
            ])),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Color(0xff2F2F2F),
            fontSize: 14,
            fontFeatures: [
              FontFeature.enable('pnum'),
              FontFeature.enable('lnum')
            ]),
        bodyText2: TextStyle(
            color: Color(0xff2F2F2F),
            fontSize: 14,
            fontFeatures: [
              FontFeature.enable('pnum'),
              FontFeature.enable('lnum')
            ]),
        subtitle1: TextStyle(
            color: Color(0xff2F2F2F),
            fontSize: 14,
            fontFeatures: [
              FontFeature.enable('pnum'),
              FontFeature.enable('lnum')
            ]),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    ),
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: child!,
      );
    },
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        body: Stack(children: [
      SvgPicture.asset(
        'assets/images/loginScreen.svg',
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: const [
                  Text(
                    'Работай на себя',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      height: 1.16,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Портал для самозанятых предоставляет удобный сервис для поиска работы самозанятым',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 61,
            ),
            MaterialButton(
                minWidth: double.infinity,
                child: const Text(
                  "НАЧАТЬ ПОИСК",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    height: 1.43,
                  ),
                ),
                color: Theme.of(context).colorScheme.secondary,
                height: 52,
                shape: (RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(builder: (context) => Splash()),
                  );
                }),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    ]));
  }
}
