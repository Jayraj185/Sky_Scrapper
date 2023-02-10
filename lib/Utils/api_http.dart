import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper_3/Screens/HomeScreen/Model/AllData.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Model/CovidModel.dart';

class ApiHttp {
  String link = "https://randomuser.me/api/";
  String CovidApiLink = "https://corona-virus-world-and-india-data.p.rapidapi.com/api";

  Future<AllData?> getApi() async
  {
    var response = await http.get(Uri.parse(link));

    if (response.statusCode == 200)
    {
      print("===========> ${response.body}");
      dynamic json = jsonDecode(response.body);
      AllData allData = AllData.fromJson(json);
      return allData;
    }
    else
    {
      print("===========> ERROR 202");
      return null;
    }
  }
  Future<CovidModel?> GetCovidData() async
  {
    var response = await http.get(Uri.parse(CovidApiLink),headers: {"X-RapidAPI-Key" : "7cd293d082msh94aaf84a741d0e7p1876a3jsn70569604fabc","X-RapidAPI-Host" : "corona-virus-world-and-india-data.p.rapidapi.com"});
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.body);
        return CovidModel.fromJson(json);
      }
    else
      {
        print("========= ERRO 400");
        return null;
      }
  }
}
