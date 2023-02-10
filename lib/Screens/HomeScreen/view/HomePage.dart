import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Provider/HomeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SKY SCRAPPER'S"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
                width: 66.w,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'SkyScrapper1');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("CRYPTO CONVERT FOR ANDROID"),
                ),
              ),
              SizedBox(height: 6.h,),
              SizedBox(
                height: 5.h,
                width: 66.w,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'SkyScrapper2');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("COVID-19 CORONA CASES"),
                ),
              ),
              SizedBox(height: 6.h,),
              SizedBox(
                height: 5.h,
                width: 66.w,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'SkyScrapper3');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("GENERATE RANDOM PEOPLE DATA"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
