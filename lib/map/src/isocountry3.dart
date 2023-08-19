// Class for IsoCountry3 for data fetched from json file /asset/data_iso_3166-1.json

import 'dart:convert';

import 'package:flutter/services.dart';

class IsoCountry3 {
  final String name;
  final String alpha2;
  final String alpha3;
  final String? numeric;
  final String withdrawal_date;

  IsoCountry3({required this.name, required this.alpha2, required this.alpha3, this.numeric,required this.withdrawal_date});

  factory IsoCountry3.fromJson(Map<String, dynamic> json) {
    return IsoCountry3(
      name: json['name'],
      alpha2: json['alpha-2'],
      alpha3: json['alpha-3'],
      numeric: json['numeric'],
      withdrawal_date: json['withdrawal_date'],
    );
  }
}

//import json file /asset/data_iso_3166-*.json into IsoCountry3Rec arrary of type IsoCountry3
Future<List<IsoCountry3>> loadIsoCountry3Rec(String iso3166) async {
  final data = await rootBundle.loadString('assets/data_iso_3166-$iso3166.json');
  final jsonResult = json.decode(data);
  return (jsonResult as List).map((e) => IsoCountry3.fromJson(e)).toList();
}

//Funtion that takes 3 parameteres List<IsoCountry3>, name, alpha-2  and returns alpha-3
String getAlpha3(List<IsoCountry3> IsoCountry3Rec, String name, String alpha2) {
  String alpha3 = '';
  for (var i = 0; i < IsoCountry3Rec.length; i++) {
    if (IsoCountry3Rec[i].name == name && IsoCountry3Rec[i].alpha2 == alpha2) {
      alpha3 = IsoCountry3Rec[i].alpha3;
      break;
    }
  }
  return alpha3;
}








