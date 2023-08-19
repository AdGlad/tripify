// Class for IsoCountry2 for data fetched from json file /asset/data_iso_3166-1.json

import 'dart:convert';

import 'package:flutter/services.dart';

class IsoCountry2 {
  final String code;
  final String name;
  final String? parent;
  final String type;

  IsoCountry2({required this.code, required this.name,  this.parent, required this.type});

  factory IsoCountry2.fromJson(Map<String, dynamic> json) {
    return IsoCountry2(
      code: json['code'],
      name: json['name'],
      parent: json['parent'],
      type: json['type'],
    );
  }
}

Future<List<IsoCountry2>> loadIsoCountry2Rec(String iso3166) async {
//Future<List<IsoCountry2>> loadIsoCountry2Rec(String iso3166) async {
  final data = await rootBundle.loadString('assets/data_iso_3166-$iso3166.json');
  final jsonResult = json.decode(data);
  return (jsonResult['3166-2'] as List).map((e) => IsoCountry2.fromJson(e)).toList() ;
}

//Funtion that takes 2 parameteres List<IsoCountry2>, code and returns name
String IsoCountry2GetCode(List<IsoCountry2> IsoCountry2Rec, dynamic code, ) {
  //String name= '';
  String? parent= '';
  String mapcode= '';

  for (var i = 0; i < IsoCountry2Rec.length; i++) {
    if (IsoCountry2Rec[i].code == code) {
     // name = IsoCountry2Rec[i].name;
      parent = IsoCountry2Rec[i].parent;
      break;
    }
  }
  if (parent !=null) {
        if (code.length >=3) {
        mapcode = code.substring(0,3)+parent;
        }
        else
        mapcode = code+parent;
  } else
  {  mapcode = code;

}

     return mapcode;
}








