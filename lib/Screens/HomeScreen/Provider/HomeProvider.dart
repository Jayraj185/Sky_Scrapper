import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_scrapper_3/Screens/HomeScreen/Model/AllData.dart';
import 'package:sky_scrapper_3/Utils/api_http.dart';

class HomeProvider extends ChangeNotifier
{
  //Only's Variable's
  int index=0;
  String CurrencyName = "JPY";
  String BTC1 = "28,65,615.03";
  String ETH1 = "2,02,262.67";
  String XRP1 = "50.50";
  String link = "https://randomuser.me/api/";
  List list = [
    "JPY",
    "EUR",
    "ZAR",
    "CAD",
    "CNY",
    "AUD",
  ];
  List XRP = [
    "50.50",
    "0.36",
    "6.83",
    "0.52",
    "2.61",
    "0.55",
  ];
  List BTC = [
    "28,72,646.64",
    "20,351.73",
    "3,88,687.30",
    "29,380.41",
    "1,48,496.01",
    "31,518.58",
  ];
  List ETH = [
    "2,02,848.14",
    "1,436.98",
    "27,438.75",
    "2,074.58",
    "10,485.05",
    "2,225.44",
  ];
  AllData? a1 = AllData();
  List WorldLeading = [
    "Total Cases",
    "New Cases",
    "Total Deaths",
    "New Deaths",
    "Total Recovered",
    "Active Cases",
    "Serious Critical",
    "Total Cases Per 1m Population",
    "Deaths Per 1m Population",
  ];
  List CountryLeading = [
    "Cases",
    "Deaths",
    "Total Recovered",
    "New Deaths",
    "New Cases",
    "Serious Critical",
    "Active Cases",
    "Total Cases Per 1m Population",
    "Deaths Per 1m Population",
    "Total Tests",
    "Tests Per 1m Population",
  ];
  List countrydata = [];
  List worlddata = [];
  List JPY = [];



  //Only's Function's
  void ChnageValue(value)
  {
    CurrencyName = value;
    notifyListeners();
  }
  void ChnageValue2(i)
  {
    BTC1 = BTC[i];
    XRP1 = XRP[i];
    ETH1 = ETH[i];
    notifyListeners();
  }
  AllData? data;
  void Refresh(d)
  {
    data = d;
    print("============ ${data!.results![0].gender}");
    notifyListeners();
  }
  void ChnageIndex(value)
  {
    index = value;
    notifyListeners();
  }
  void AddCountryData(i,country)
  {
    countrydata = [
      country[i].cases,
      country[i].deaths,
      country[i].totalRecovered,
      country[i].newDeaths,
      country[i].newCases,
      country[i].seriousCritical,
      country[i].activeCases,
      country[i].testsPer1mPopulation,
      country[i].deathsPer1mPopulation,
      country[i].totalTests,
      country[i].testsPer1mPopulation,
    ];
    notifyListeners();
  }
  void AddWorldData(world)
  {
    worlddata = [
      world!.totalCases,
      world.newCases,
      world.totalDeaths,
      world.newDeaths,
      world.totalRecovered,
      world.activeCases,
      world.seriousCritical,
      world.totalCasesPer1mPopulation,
      world.deathsPer1mPopulation,
    ];
    notifyListeners();
  }
}