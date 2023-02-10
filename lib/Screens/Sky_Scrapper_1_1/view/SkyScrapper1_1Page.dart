import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Provider/HomeProvider.dart';
import 'package:sky_scrapper_3/Utils/container.dart';

class SkyScrapper1_1Page extends StatefulWidget {
  const SkyScrapper1_1Page({Key? key}) : super(key: key);

  @override
  State<SkyScrapper1_1Page> createState() => _SkyScrapper1_1PageState();
}

class _SkyScrapper1_1PageState extends State<SkyScrapper1_1Page> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CRYPTO CONVERT ANDROID"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60.h,
                //color: Colors.blue,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                      child: container("BTC", "${ProviderTrue!.BTC1}", "${ProviderTrue!.CurrencyName}", context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                      child: container("ETH", "${ProviderTrue!.ETH1}", "${ProviderTrue!.CurrencyName}", context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                      child: container("XRP", "${ProviderTrue!.XRP1}", "${ProviderTrue!.CurrencyName}", context),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 8.h,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Current Currency",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Colors.red,
                        icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,),
                        items: ProviderTrue!.list.asMap().entries.map((e) => DropdownMenuItem(
                          child: Text(
                            "${ProviderTrue!.list[e.key]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp
                            ),
                          ),
                          value: "${ProviderTrue!.list[e.key]}",
                          onTap: () {
                            ProviderFalse!.ChnageValue2(e.key);
                          },
                        ),).toList(),
                        value: ProviderTrue!.CurrencyName,
                        onChanged: (value) {
                          ProviderFalse!.ChnageValue(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
