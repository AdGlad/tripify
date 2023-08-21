import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'dart:convert';
import 'package:http/http.dart' as http;

// This doesn't exist yet...! See "Next Steps"
part 'placehistory.g.dart';



@firestoreSerializable
class CurrentUser {
  CurrentUser({required this.id, this.userId, this.email, this.displayname});
  //{
  //   _$assertPlaceHistory(this);
  // }

  factory CurrentUser.fromJson(Map<String, Object?> json) =>
      _$CurrentUserFromJson(json);

  //String get id => FirebaseAuth.instance.currentUser!.uid;

  @Id()
  final String id;
  String? userId;
  String? email;
  String? displayname;

  Map<String, Object?> toJson() => _$CurrentUserToJson(this);
}





@firestoreSerializable
class CurrentCountry {
  CurrentCountry({
    required this.countryCode,
    this.countryName,
    this.userId,
    this.alpha3code,
    this.callingcode,
    this.capital,
    this.subregion,
    this.region,
    this.population,
    this.timezones,
    this.numericCode,
    this.flag,
    this.longitude,
    this.latitude,
    this.currencycode,
    this.currencyname,
    this.currencysymbol,
    this.langiso6391,
    this.langname,
    this.arrivaldate,
    this.departuredate,


  });
  //{
  //   _$assertPlaceHistory(this);
  // }

  factory CurrentCountry.fromJson(Map<String, Object?> json) =>
      _$CurrentCountryFromJson(json);

  //String get id => FirebaseAuth.instance.currentUser!.uid;

  @Id()
  final String countryCode;
  String? countryName;
  String? userId;
  String? alpha3code;
  String? callingcode;
  String? capital;
  String? subregion;
  String? region;
  int? population;
  String? timezones;
  String? numericCode;
  String? flag;
  double? longitude;
  double? latitude;
  String? currencycode;
  String? currencyname;
  String? currencysymbol;
  String? langiso6391;
  String? langname;
  DateTime? arrivaldate;
  DateTime? departuredate;


  Map<String, Object?> toJson() => _$CurrentCountryToJson(this);
}



//@Collection<PlaceHistory>('placehistory')
@firestoreSerializable
class Region {
  Region(
      {required this.regionCode,
      required this.region,
      this.apiregionCode,
      this.countryCode,
      this.userId});
  //{
  //   _$assertPlaceHistory(this);
  // }

  factory Region.fromJson(Map<String, Object?> json) => _$RegionFromJson(json);

  //String get id => FirebaseAuth.instance.currentUser!.uid;

  @Id()
  final String regionCode;
  String? region;
  String? apiregionCode;
  String? countryCode;
  String? userId;

  Map<String, Object?> toJson() => _$RegionToJson(this);
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

//@Collection<PlaceHistory>('placehistory')
@firestoreSerializable
class PlaceHistory {
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
    this.imagePaths,
    this.locationRaw
      });
  //{
  //   _$assertPlaceHistory(this);
  // }

  factory PlaceHistory.fromJson(Map<String, Object?> json) =>
      _$PlaceHistoryFromJson(json);

  //String get id => FirebaseAuth.instance.currentUser!.uid;

   @Id()
  late final String? id;
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
  String? locationRaw;
  List<String>? imagePaths;

  Map<String, Object?> toJson() => _$PlaceHistoryToJson(this);
}


@Collection<CurrentUser>('currentuser')
@Collection<CurrentCountry>('currentuser/*/country')
@Collection<Region>('currentuser/*/country/*/region')
@Collection<PlaceHistory>('currentuser/*/country/*/region/*/placehistory')
final currentuserRef = CurrentUserCollectionReference();
//final UsersCollectionReference = UserCollectionReference();
CurrentCountryCollectionReference countryRef =
    currentuserRef.doc('wedww').country;
RegionCollectionReference regionRef = countryRef.doc('wefdw').region;
PlaceHistoryCollectionReference placehistoryRef =
    regionRef.doc('wedwef').placehistory;

// final countyRef = CountryCollectionReference();
// final regionRef = RegionCollectionReference();
// final placehistoryRef = PlaceHistoryCollectionReference();

class PlaceHistoryList extends StatefulWidget {
  @override
  State<PlaceHistoryList> createState() => _PlaceHistoryListState();
}

class _PlaceHistoryListState extends State<PlaceHistoryList> {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PlaceHistoryQuerySnapshot>(
        ref: placehistoryRef.whereDocumentId(isEqualTo: 'BnFlsKQ0VROq3upyO4au'),
        builder: (context, AsyncSnapshot<PlaceHistoryQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading PlaceHistory...');

          // Access the QuerySnapshot
          PlaceHistoryQuerySnapshot querySnapshot = snapshot.requireData;

          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              PlaceHistory placehistory = querySnapshot.docs[index].data;

              return Text(
                  'Text: ${placehistory.city}, age ${placehistory.countryCode}');
            },
          );
        });
  }
}

class FirestoreService {
  // CollectionReference region = FirebaseFirestore.instance.collection('region');
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  CollectionReference currentuserref =
      FirebaseFirestore.instance.collection('currentuser');
  CollectionReference placehistoryref =
      FirebaseFirestore.instance.collection('placehistory');
  // Future<String> setRegion(Region region) {
  //   //adicionar o objecto em forma de json para a coleção de placehistory
  //   return region
  //       .doc(region.region)
  //       .set(region.toJson())
  //       //.add(place.toJson())
  //       .then((value) => "Mais um placehistory adicionado à família")
  //       .catchError((error) =>
  //           "Parece que teve problemas com o último placehistory:\n $error");
  // }

  Future<String> setCurrentUser(CurrentUser currentuser) {
    return currentuserref
        .doc(currentuser.userId)
        .set(currentuser.toJson())
        //.add(place.toJson())
        .then((value) => "Mais um placehistory adicionado à família")
        .catchError((error) =>
            "Parece que teve problemas com o último placehistory:\n $error");
  }

  Future<String> setCountry(CurrentCountryCollectionReference countryref,
      CurrentCountry currentcountry) async {
    String urlString =
        "https://restcountries.com/v3.1/alpha/" + currentcountry.countryCode;
    var res = await http.get(
      Uri.parse(urlString),
    );
    var jsonString;
    jsonString = jsonDecode(res.body);
    developer.log(res.body, name: 'my.app.category');

    //String access_token =
    //    "pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw";

    // String alpha3code = jsonString['alpha3Code'];
    //String callingcode = jsonString['callingCodes'];
    String capital = jsonString[0]['capital'][0];
    String subregion = jsonString[0]['subregion'];
    String region = jsonString[0]['region'];
    int population = jsonString[0]['population'];
    List<double> latlng = List<double>.from(jsonString[0]['latlng']);
    String timezones = jsonString[0]['timezones'].toString();
    String numericCode = jsonString[0]['ccn3'];
    Map<String, String> flags =
        Map<String, String>.from(jsonString[0]['flags']);
    Map currencies = jsonString[0]['currencies'];

    //List<dynamic> currencies = List<dynamic>.from(jsonString[0]['currencies']);
    String flag = jsonString[0]['flag'];
    // Map<String, dynamic> language = jsonString[0]['languages'][0];
    // String langiso6391 = language['iso639_1'];
    // String langname = language['name'];

    double longitude = jsonString[0]['latlng'][0];
    double latitude = jsonString[0]['latlng'][1];
    String currencycode = 'CO';
    String currencyname = currencies.values.first['name'];
    String currencysymbol = currencies.values.first['symbol'];

    for (var code in currencies.keys) {
      Map currency = currencies[code];
      currencycode = code;
      String name = currency['name'];
      String symbol = currency['symbol'];
      //   currencyInfo[currencyCode] = {'name': name, 'symbol': symbol};
    }

    // for (var currency in currencies) {
    //   currencycode = currency['code'];
    //   currencyname = currency['name'];
    //   currencysymbol = currency['symbol'];
    // }

    // currentcountry.alpha3code = alpha3code;
    //currentcountry.callingcode = callingcode;
    currentcountry.capital = capital;
    currentcountry.subregion = subregion;
    currentcountry.region = region;
    currentcountry.population = population;
    currentcountry.timezones = timezones;
    currentcountry.numericCode = numericCode;
    currentcountry.flag = flag;
    currentcountry.longitude = longitude;
    currentcountry.latitude = latitude;
    currentcountry.currencycode = currencycode;
    currentcountry.currencyname = currencyname;
    currentcountry.currencysymbol = currencysymbol;
    // currentcountry.langiso6391 = langiso6391;
    //currentcountry.langname = langname;

    //adicionar o objecto em forma de json para a coleção de placehistory
    return countryref
        .doc(currentcountry.countryCode)
        .set(currentcountry)

        //.set(currentcountry.toJson())
        //.add(place.toJson())
        .then((value) => "Mais um placehistory adicionado à família")
        .catchError((error) =>
            "Parece que teve problemas com o último placehistory:\n $error");
  }

  Future<String> setRegion(
      RegionCollectionReference regionref, Region currentregion) {
    //adicionar o objecto em forma de json para a coleção de placehistory
    return regionref
        .doc(currentregion.regionCode)
        .set(currentregion)
        //.set(currentcountry.toJson())
        //.add(place.toJson())
        .then((value) => "Mais um placehistory adicionado à família")
        .catchError((error) =>
            "Parece que teve problemas com o último placehistory:\n $error");
  }

  // Future<String> setPlaceHistory(
  //     PlaceHistoryCollectionReference placehistoryref, PlaceHistory place) {
  //   //adicionar o objecto em forma de json para a coleção de placehistory
  //   return placehistoryref
  //       .doc(place.)
  //       .set(place)
  //       //.add(place.toJson())
  //       .then((value) => "Mais um placehistory adicionado à família")
  //       .catchError((error) =>
  //           "Parece que teve problemas com o último placehistory:\n $error");
  // }

  Future<String> addPlaceHistory(
      PlaceHistoryCollectionReference placehistoryref, PlaceHistory place) {
    //adicionar o objecto em forma de json para a coleção de placehistory
    return placehistoryref
        .add(place)
        .then((value) => value.id )
        .catchError((error) =>
            "Error with placehistory:\n $error");
  }

  Future<PlaceHistoryQuerySnapshot> queryCollection(queryString) async {
    return await placehistoryRef.whereName(isEqualTo: queryString).get();
  }

  // Future updateUser(nome, novoNome) {
  //   //com base na coleção pegamos todos os dados que nela existem, que retorna
  //   //QuerySnapshot e usando o mesmo para iterar pelos documentos dentro dele
  //   return placehistory.get().then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       //verificar se o dcumento tem como atributo nome igual ao pretendido alterar
  //       if (doc['nome'] == nome) {
  //         placehistory
  //             .doc(doc.id) //pegar o id do documento que se pretende actualizar
  //             .update({'nome': novoNome})
  //             .then((value) => "Minion com nome actualizado")
  //             .catchError((error) =>
  //                 "Oops, parece que não deu pra actualizar:\n $error");
  //       }
  //     });
  //   });
  // }
}

// @Collection<PlaceHistory>('placehistory')
//final placehistoryidRef = PlaceHistoryCollectionReference();
PlaceHistoryCollectionReference placehistoryidRef =
    regionRef.doc('wedwef').placehistory;
// ...

// class Countrylist extends StatelessWidget {
//   Countrylist(this.id);

//   final String id;

//   @override
//   Widget build(BuildContext context) {
//     return FirestoreBuilder<CurrentCountryQuerySnapshot>(
//         // Access a specific document
//         //ref: placehistoryidRef.doc(id),
//         ref: placehistoryidRef,
//         //usersRef.whereName(isEqualTo: 'John');
//         builder: (context, AsyncSnapshot<PlaceHistoryQuerySnapshot> snapshot,
//             Widget? child) {
//           if (snapshot.hasError) return Text('Something went wrong!');
//           if (!snapshot.hasData) return Text('Loading user...');

//           // Access the UserDocumentSnapshot
//           PlaceHistoryQuerySnapshot documentSnapshot = snapshot.requireData;

//         return ListView.builder(
//           itemCount: documentSnapshot.docs.length,
//           itemBuilder: (context, index) {
//             // Access the User instance
//             PlaceHistory currentCountry = documentSnapshot.docs[index].data;

//             return Text('Country name: ${currentCountry.}, age ${user.age}');
//           },
//         );

//         //   if (!documentSnapshot.exists) {
//         //     return Text('User does not exist.');
//         //   }

//         //   PlaceHistory placehistory = documentSnapshot.data!;

//         //   return Text(
//         //       'placehistory name: ${placehistory.countryName}, age ${placehistory.city}');
//          }

//         );
//   }
// }



