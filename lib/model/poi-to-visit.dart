import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:provider/provider.dart';


part 'poi-to-visit.g.dart';

@firestoreSerializable
class PoiToVisit {
  PoiToVisit({
    required this.groupId,
     this.description,
  });

  factory PoiToVisit.fromJson(Map<String, Object?> json) =>
      _$PoiToVisitFromJson(json);

  @Id()
  final String groupId;
  String? description;


  Map<String, Object?> toJson() => _$PoiToVisitToJson(this);
}

@firestoreSerializable
class Poi{
  Poi({
    required this.poiId,
     this.geometry,
     this.id,
     this.properties,
  });

  factory Poi.fromJson(Map<String, Object?> json) =>
      _$PoiFromJson(json);

  @Id()
  final String poiId;
  Map? geometry;
  num? id;
  Map? properties;


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

@Collection<PoiToVisit>('poi-to-visit')
@Collection<Poi>('poi-to-visit/*/poi')

final poitovisitRef = PoiToVisitCollectionReference();
//final poiRef = PoiCollectionReference();

