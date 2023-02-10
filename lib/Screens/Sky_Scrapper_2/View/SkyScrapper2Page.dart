import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Model/CovidModel.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Provider/HomeProvider.dart';
import 'package:sky_scrapper_3/Utils/api_http.dart';

class SkyScrapper2Page extends StatefulWidget {
  const SkyScrapper2Page({Key? key}) : super(key: key);

  @override
  State<SkyScrapper2Page> createState() => _SkyScrapper2PageState();
}

class _SkyScrapper2PageState extends State<SkyScrapper2Page> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFlase;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    ProviderFlase = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Covid-19 Data",style: GoogleFonts.caveatBrush(color: Colors.black,fontSize: 23.sp),),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,size: 21.sp,),
          ),
          backgroundColor: Colors.white54,
        ),
        // backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/image/covid_backgraound.png",fit: BoxFit.cover,),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black54,
                child: FutureBuilder<CovidModel?>(
                  future: ApiHttp().GetCovidData(),
                  builder: (context, snapshot) {
                    if(snapshot.hasError)
                      {
                        return Center(child: Text("${snapshot.error}"),);
                      }
                    else if(snapshot.hasData)
                      {
                        WorldTotal? world = snapshot.data!.worldTotal;
                        ProviderFlase!.AddWorldData(world);
                        List<CountriesStat>? country = snapshot.data!.countriesStat;
                        return ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(top: 1.h),
                                child: Text(
                                  "World Total Corona Cases",
                                  style: GoogleFonts.caveatBrush(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25.sp
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                height: 39.h,
                                child: ListView.builder(
                                  itemCount: ProviderTrue!.WorldLeading.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 4.3.h,
                                      width: 95.w,
                                      child: ListTile(
                                        leading: Padding(
                                          padding:  EdgeInsets.only(bottom: 1.5.h),
                                          child: Text(
                                            "${ProviderTrue!.WorldLeading[index]}    :",
                                            style: GoogleFonts.caveatBrush(
                                                color: Color(0xFF99FF00),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp
                                            ),
                                          ),
                                        ),
                                        title: Padding(
                                          padding:  EdgeInsets.only(bottom: 1.5.h),
                                          child: Text(
                                            "${ProviderTrue!.worlddata[index]}",
                                            style: GoogleFonts.caveatBrush(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                fontSize: 16.sp
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(top: 1.h),
                                child: Text(
                                  "Country Vise Total Corona Cases",
                                  style: GoogleFonts.caveatBrush(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25.sp
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 83.h,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: country!.length,
                                itemBuilder: (context, i) {
                                  ProviderFlase!.AddCountryData(i, country);
                                  return Container(
                                    height: 53.h,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 3.w),
                                            child: Container(
                                              child: Text(
                                                "${country[i].countryName}",
                                                style: GoogleFonts.caveatBrush(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 21.sp
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 48.h,
                                            child:Column(
                                              children: ProviderTrue!.CountryLeading.asMap().entries.map((e) => Container(
                                                height: 4.3.h,
                                                width: 95.w,
                                                child: ListTile(
                                                  leading: Padding(
                                                    padding:  EdgeInsets.only(bottom: 1.5.h),
                                                    child: Text(
                                                      "${ProviderTrue!.CountryLeading[e.key]}    :",
                                                      style: GoogleFonts.caveatBrush(
                                                          color: Color(0xFF99FF00),
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16.sp
                                                      ),
                                                    ),
                                                  ),
                                                  title: Padding(
                                                    padding:  EdgeInsets.only(bottom: 1.5.h),
                                                    child: Text(
                                                      "${ProviderTrue!.countrydata[e.key]}",
                                                      style: GoogleFonts.caveatBrush(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                          fontSize: 16.sp
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )).toList(),
                                            )
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      }
                    return Center(child: CircularProgressIndicator(color: Colors.white,),);
                  },
                ),
            ),

          ],
        )
      ),
    );
  }
}
