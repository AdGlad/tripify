import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

class PlaceHistory {
  String? id;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  double? distance;
  String? streetAddress;
  String? city;
  String? countryName;
  String? countryCode;
  String? postal;
  String? region;
  String? regionCode;
  String? apiregionCode;
  String? timezone;
  int? elevation;
  int? timestamp;
  DateTime? arrivaldate;
  int? visitnumber;
  String? userId;
  String? description;
  String? rating;
  String? poi;
  num? poiId;
  String? poiName;
  List<String>? poiGroupIds;
  String? locationRaw;
  List<String>? imagePaths;


  PlaceHistory(
      {
      this.id,
      this.name,
      this.location,
      this.latitude,
      this.longitude,
      this.distance,
      this.streetAddress,
      this.city,
      this.countryName,
      this.countryCode,
      this.postal,
      this.region,
      this.regionCode,
      this.apiregionCode,
      this.timezone,
      this.elevation,
      this.timestamp,
      this.arrivaldate,
      this.visitnumber,
      this.userId,
      this.description,
    this.rating,
    this.poi,
    this.poiId,
    this.poiName,
    this.poiGroupIds,
    this.imagePaths,
    this.locationRaw
      });


  factory PlaceHistory.fromJson(Map<String, dynamic> documentData) {
    int timeInMillis = documentData['timestamp'] as int;
    DateTime currentArrivaldate =
        DateTime.fromMillisecondsSinceEpoch(timeInMillis);

    dynamic poiData = documentData['poi'];
    String? poi;
    // Check if poiData is of type String or null
    if (poiData is String || poiData == null) {
      // Cast poiData to String? (nullable String)
      poi = poiData as String?;
    }

      final _placeHistory = PlaceHistory(
      userId: FirebaseAuth.instance.currentUser!.uid,
      name: documentData['name'] as String,
      latitude: documentData['_latitude'] as double,
      longitude: documentData['_longitude'] as double,
      streetAddress: documentData['streetAddress'] as String,
      city: documentData['city'] as String,
      countryName: documentData['countryName'] as String,
      countryCode: documentData['countryCode'] as String,
      postal: documentData['postal'] as String?,
      region: documentData['region'] as String?,
      regionCode: documentData['regionCode'] as String?,
      timezone: documentData['timezone'] as String?,
      elevation: documentData['elevation'] as int?,
      visitnumber: documentData['visitnumber'] as int?,
      description: documentData['description'] as String?,
      rating: documentData['rating'] as String?,
      //    poi: documentData['poi'] as String?,
      poi: poi,
      // imagePaths: documentData()['imagePaths'] as List<String>?,
      imagePaths:
          (documentData['imagePaths'] as List<dynamic>?)?.cast<String>(),
      arrivaldate: currentArrivaldate);

  developer.log('_placeHistory.add  in ');

  return _placeHistory;

    // return PlaceHistory(
    //   apiregionCode: json['apiregionCode'],
    //   arrivaldate: currentArrivaldate,
    //   city: json['city'],
    //   countryCode: json['countryCode'],
    //   countryName: json['countryName'],
    //   description: json['description'],
    //   distance: json['distance'],
    //   elevation: json['elevation'],
    //   imagePaths: List<String>.from(json['imagePaths']),
    //   latitude: json['latitude'],
    //   region: json['region'],
    //   regionCode: json['regionCode'],
    //   streetAddress: json['streetAddress'],
    //   timestamp: json['timestamp'],
    //   timezone: json['timezone'],
    //   userId: json['userId'],
    //   visitnumber: json['visitnumber'],
    //   poi: poi,
    //   poiId: json['poiId'],
    //   poiName: json['poiName'],
    //   poiGroupIds: List<String>.from(json['poiGroupIds']),
    //   locationRaw: json['locationRaw'],
    //   id: json['id'],
    //   name: json['name'],
    //   location: json['location'],
    //   longitude: json['longitude'],
    //   postal: json['postal'],
    // );
  }

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'location': location,
    'latitude': latitude,
    'longitude': longitude,
    'distance': distance,
    'streetAddress': streetAddress,
    'city': city,
    'countryName': countryName,
    'countryCode': countryCode,
    'postal': postal,
    'region': region,
    'regionCode': regionCode,
    'apiregionCode': apiregionCode,
    'timezone': timezone,
    'elevation': elevation,
    'timestamp': timestamp,
    'arrivaldate': arrivaldate?.millisecondsSinceEpoch,
    'visitnumber': visitnumber,
    'userId': userId,
    'description': description,
    'rating': rating,
    'poi': poi,
    'poiId': poiId?.toString(),
    'poiName': poiName,
    'poiGroupIds': poiGroupIds,
    'imagePaths': imagePaths,
    'locationRaw': locationRaw,
  };
}

  
PlaceHistory placeHistoryfunc(Map<String, dynamic> documentData) {
  int timeInMillis = documentData['timestamp'] as int;
  DateTime currentArrivaldate =
      DateTime.fromMillisecondsSinceEpoch(timeInMillis);

  dynamic poiData = documentData['poi'];
  String? poi;
// Check if poiData is of type String or null
  if (poiData is String || poiData == null) {
    // Cast poiData to String? (nullable String)
    poi = poiData as String?;

    // Now you can use poi as a nullable String
    // Do whatever you need to do with poi
  } else {
    poi = poiData
        .toString(); // Handle the case where poiData is of a different type (e.g., int)
    // You can decide what to do here based on your requirements
  }

  final _placeHistory = PlaceHistory(
      userId: FirebaseAuth.instance.currentUser!.uid,
      name: documentData['name'] as String,
      latitude: documentData['latitude'] as double,
      longitude: documentData['longitude'] as double,
      streetAddress: documentData['streetAddress'] as String,
      city: documentData['city'] as String,
      countryName: documentData['countryName'] as String,
      countryCode: documentData['countryCode'] as String,
      postal: documentData['postal'] as String?,
      region: documentData['region'] as String?,
      regionCode: documentData['regionCode'] as String?,
      timezone: documentData['timezone'] as String?,
      elevation: documentData['elevation'] as int?,
      visitnumber: documentData['visitnumber'] as int?,
      description: documentData['description'] as String?,
      rating: documentData['rating'] as String?,
      //    poi: documentData['poi'] as String?,
      poi: poi,
      // imagePaths: documentData()['imagePaths'] as List<String>?,
      imagePaths:
          (documentData['imagePaths'] as List<dynamic>?)?.cast<String>(),
      arrivaldate: currentArrivaldate);

  developer.log('_placeHistory.add  in ');

  return _placeHistory;
}
}
