// Class for IsoCountry1 for data fetched from json file /asset/data_iso_3166-1.json

import 'dart:convert';

import 'package:flutter/services.dart';

class IsoCountry1 {
  final String name;
  final String alpha2;
  final String alpha3;
  final String numeric;
  final String? official_name;

  IsoCountry1({required this.name, required this.alpha2, required this.alpha3, required this.numeric, this.official_name});

  factory IsoCountry1.fromJson(Map<String, dynamic> json) {
    return IsoCountry1(
      name: json['name'],
      alpha2: json['alpha-2'],
      alpha3: json['alpha-3'],
      numeric: json['numeric'],
      official_name: json['official_name'],
    );
  }
}

//import json file /asset/data_iso_3166-*.json into IsoCountry1Rec arrary of type IsoCountry1
Future<List<IsoCountry1>> loadIsoCountry1Rec(String iso3166) async {
  final data = await rootBundle.loadString('assets/data_iso_3166-$iso3166.json.json');
  final jsonResult = json.decode(data);
  return (jsonResult as List).map((e) => IsoCountry1.fromJson(e)).toList();
}

//Funtion that takes 3 parameteres List<IsoCountry1>, name, alpha-2  and returns alpha-3
String getAlpha3(List<IsoCountry1> IsoCountry1Rec, String name, String alpha2) {
  String alpha3 = '';
  for (var i = 0; i < IsoCountry1Rec.length; i++) {
    if (IsoCountry1Rec[i].name == name && IsoCountry1Rec[i].alpha2 == alpha2) {
      alpha3 = IsoCountry1Rec[i].alpha3;
      break;
    }
  }
  return alpha3;
}








