import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:provider/provider.dart';


part 'topPoi.g.dart';

@firestoreSerializable
class TopPoi {
  TopPoi({
    required this.groupId,
    required this.title,
    required this.description,
  });

  factory TopPoi.fromJson(Map<String, Object?> json) =>
      _$TopPoiFromJson(json);

  @Id()
  final String groupId;
  String? title;
  String? description;


  Map<String, Object?> toJson() => _$TopPoiToJson(this);
}

@firestoreSerializable
class Poi{
  Poi({
    required this.poiId,
     this.latitude,
     this.longitude,
     this.geometry,
     this.id,
     this.properties,
     this.category,
     this.poiclass,
     this.iso_3166_1,
     this.iso_3166_2,
     this.maki,
     this.name,
     this.type,
     this.imagePath,
     this.poiRadius,
     this.groupId,
     
  });

  factory Poi.fromJson(Map<String, Object?> json) =>
      _$PoiFromJson(json);

  @Id()
  final String poiId;
  double? latitude;
  double? longitude;
  Map? geometry;
  num? id;
  Map? properties;
  String? category;
  String? poiclass;
  String? iso_3166_1;
  String? iso_3166_2;
  String? maki;
  String? name;
  String? type;
  String? imagePath;
  num? poiRadius;
  String? groupId;



  Map<String, Object?> toJson() => _$PoiToJson(this);
}



/// A custom JsonSerializable annotation that supports decoding objects such
/// as Timestamps and DateTimes.
/// This variable can be reused between different models
const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);

@Collection<TopPoi>('toppoi')
@Collection<Poi>('toppoi/*/poi')

final toppoiRef = TopPoiCollectionReference();
//final poiRef = PoiCollectionReference();

