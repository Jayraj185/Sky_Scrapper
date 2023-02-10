import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Model/AllData.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Provider/HomeProvider.dart';
import 'package:sky_scrapper_3/Utils/api_http.dart';

class SkyScrapper3Page extends StatefulWidget {
  const SkyScrapper3Page({Key? key}) : super(key: key);

  @override
  State<SkyScrapper3Page> createState() => _SkyScrapper3PageState();
}

class _SkyScrapper3PageState extends State<SkyScrapper3Page> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;

  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("RANDOM PEOPLE DATA"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: IconButton(
                onPressed: ()async {
                  ProviderFalse!.Refresh(await ApiHttp().getApi());
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder<AllData?>(
            future: ApiHttp().getApi(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              else if (snapshot.hasData!) {
                print("============>>>> ${snapshot.data}");
                ProviderFalse!.Refresh(snapshot.data!);
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 15.h,
                          width: 15.h,
                          margin: EdgeInsets.only(bottom: 1.5.h),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  "${ProviderTrue!.data!.results![0].picture!.large}")),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${ProviderTrue!.data!.results![0].name!.title} ${ProviderTrue!.data!.results![0].name!.first} ${ProviderTrue!.data!.results![0].name!.last} BIO DATA",
                          style: TextStyle(color: Colors.red, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 3.h,
                        alignment: Alignment.topLeft,
                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Name :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].name!.title} ${ProviderTrue!.data!.results![0].name!.first} ${ProviderTrue!.data!.results![0].name!.last}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Email :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].email}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Phone :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].phone}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Cell :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].cell}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Address :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].location!.street!.number} ${ProviderTrue!.data!.results![0].location!.street!.name}, ${ProviderTrue!.data!.results![0].location!.city},\n${ProviderTrue!.data!.results![0].location!.state}, ${ProviderTrue!.data!.results![0].location!.country} -${ProviderTrue!.data!.results![0].location!.postcode}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Coordinates :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "latitude :   ${ProviderTrue!.data!.results![0].location!.coordinates!.latitude}\nlongitude :   ${ProviderTrue!.data!.results![0].location!.coordinates!.longitude}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 6.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Timezone :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Offset :   ${ProviderTrue!.data!.results![0].location!.timezone!.offset}\nDescription :\n${ProviderTrue!.data!.results![0].location!.timezone!.description}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10.sp,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Dob Date :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].dob!.date}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Dob Age :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].dob!.age}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "NAT :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].nat}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "REGISTERED",
                          style: TextStyle(color: Colors.red, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Registered Date :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].registered!.date}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Registered Age :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].registered!.age}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.red, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Login UUID :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].login!.uuid}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Login Username :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].login!.username}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Login Password :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].login!.password}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Login Salt :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].login!.salt}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Login MD5 :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.results![0].login!.md5}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "INFO",
                          style: TextStyle(color: Colors.red, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Info Seed :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.info!.seed}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Info Results :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.info!.results}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Info Page :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.info!.page}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        // color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Info Version :",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${ProviderTrue!.data!.info!.version}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator(color: Colors.red,));
            }),
      ),
    );
  }
}
