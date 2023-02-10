import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Provider/HomeProvider.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/view/HomePage.dart';
import 'package:sky_scrapper_3/Screens/Sky_Scrapper_1_1/view/SkyScrapper1_1Page.dart';
import 'package:sky_scrapper_3/Screens/Sky_Scrapper_1_2/view/Sky_Scrapper_1_2.dart';
import 'package:sky_scrapper_3/Screens/Sky_Scrapper_2/View/SkyScrapper2Page.dart';
import 'package:sky_scrapper_3/Screens/Sky_Scrapper_3/view/SkyScrapper3Page.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Platform.isAndroid?Android():Ios();
        },
      ),
    )
  );
}
Widget Android()
{
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => HomePage(),
      'SkyScrapper1' : (context) => SkyScrapper1_1Page(),
      'SkyScrapper2' : (context) => SkyScrapper2Page(),
      'SkyScrapper3' : (context) => SkyScrapper3Page(),
    },
  );
}
Widget Ios()
{
  return CupertinoApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => Sky_Scrapper_1_2(),
    },
  );
}