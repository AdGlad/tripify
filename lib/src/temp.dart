import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Country {
  final String alpha2;
  final String alpha3;
  final String name;
  final String numeric;
  final String officialName;

  Country({
    required this.alpha2,
    required this.alpha3,
    required this.name,
    required this.numeric,
    this.officialName = "",
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      alpha2: json['alpha_2'],
      alpha3: json['alpha_3'],
      name: json['name'],
      numeric: json['numeric'],
      officialName: json['official_name'] ?? "",
    );
  }
}



class CountryData {
  List<Country> countries = [];

  CountryData(String jsonStr) {
    final jsonData = json.decode(jsonStr);
    final countryList = jsonData['3166-1'] as List<dynamic>;

    countries = countryList.map((item) => Country.fromJson(item)).toList();
  }

  String? getAlpha3FromAlpha2(String alpha2) {
    final country = countries.firstWhere((c) => c.alpha2 == alpha2, orElse: () => Country(alpha2: '', alpha3: '', name: '', numeric: ''));
    return country.alpha3;
  }
}

class IsoCountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: loadCountryData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final countryData = snapshot.data as List<CountryData>;
              // Now you have access to the loaded CountryData instances
              // Use them as needed
              return Center(
                child: Text('Country Data Loaded'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<CountryData>> loadCountryData() async {
    final List<String> assetPaths = [
      'assets/data_iso_3166-1_1.json',
   //   'assets/data_iso_3166-1_2.json',
   //   'assets/data_iso_3166-1_3.json',
    ];

    List<CountryData> countryDataList = [];

    for (String assetPath in assetPaths) {
      String jsonData = await rootBundle.loadString(assetPath);
      CountryData countryData = CountryData(jsonData);
      countryDataList.add(countryData);
          debugPrint('Loaded data from $assetPath');

    }

    return countryDataList;
  }
}

