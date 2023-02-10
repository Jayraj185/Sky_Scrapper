import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Provider/HomeProvider.dart';
import 'package:sky_scrapper_3/Utils/container.dart';

class Sky_Scrapper_1_2 extends StatefulWidget {
  const Sky_Scrapper_1_2({Key? key}) : super(key: key);

  @override
  State<Sky_Scrapper_1_2> createState() => _Sky_Scrapper_1_2State();
}

class _Sky_Scrapper_1_2State extends State<Sky_Scrapper_1_2> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("CRYPTO CONVERT IOS",style: TextStyle(color: CupertinoColors.white),),
          backgroundColor: CupertinoColors.systemRed,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50.h,
                //color: Colors.blue,
                margin: EdgeInsets.only(top: 0.6.h),
                child: Column(
                  children: [
                    container("BTC", "${ProviderTrue!.BTC[ProviderTrue!.index]}", "${ProviderTrue!.list[ProviderTrue!.index]}", context),
                    container("ETH", "${ProviderTrue!.ETH[ProviderTrue!.index]}", "${ProviderTrue!.list[ProviderTrue!.index]}", context),
                    container("XRP", "${ProviderTrue!.XRP[ProviderTrue!.index]}", "${ProviderTrue!.list[ProviderTrue!.index]}", context),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 15.h,
                color: CupertinoColors.systemRed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Current Currency",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 40.w,
                      //color: CupertinoColors.systemOrange,
                      child: CupertinoPicker(
                        itemExtent: 35,
                        onSelectedItemChanged: (value) {
                          ProviderFalse!.ChnageIndex(value);
                          },
                          useMagnifier: true,
                          selectionOverlay: Container(
                            height: 5.h,
                          ),
                        children: ProviderTrue!.list.asMap().entries.map((e) => Container(
                            height: 5.h,
                            width: 30.h,
                            alignment: Alignment.center,
                            child: Text(
                                "${ProviderTrue!.list[e.key]}",
                              style: TextStyle(
                                color: CupertinoColors.white
                              ),
                            )
                        )).toList()
                      ),
                    )
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton(
                    //     dropdownColor: Colors.red,
                    //     icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,),
                    //     items: [
                    //       DropdownMenuItem(
                    //         child: Text(
                    //           "JPY",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15.sp
                    //           ),
                    //         ),
                    //         value: "JPY",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text(
                    //           "APY",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15.sp
                    //           ),
                    //         ),
                    //         value: "APY",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text(
                    //           "BPY",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15.sp
                    //           ),
                    //         ),
                    //         value: "BPY",
                    //       ),
                    //     ],
                    //     value: ProviderTrue!.CurrencyName,
                    //     onChanged: (value) {
                    //       ProviderFalse!.ChnageValue(value);
                    //     },
                    //   ),
                    // ),
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
