import 'region.dart';

class Country {
  final String? alpha3code;
  final dynamic arrivaldate;
  final dynamic callingcode;
  final String? capital;
  final String? countryCode;
  final String? countryName;

  final List<Region>? regions;

  Country({
    this.alpha3code,
    this.arrivaldate,
    this.callingcode,
    this.capital,
    this.countryCode,
    this.countryName,
    this.regions,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        alpha3code: json['alpha3code'],
        arrivaldate: json['arrivaldate'],
        callingcode: json['callingcode'],
        capital: json['capital'],
        countryCode: json['countryCode'],
        countryName: json['countryName'],
        regions: (json['regions'] as List)
            .map((e) => Region.fromJson(e))
            .toList(),
      );

      Map<String, dynamic> toJson() {
  return {
    'alpha3code': alpha3code,
    'arrivaldate': arrivaldate,
    'callingcode': callingcode,
    'capital': capital,
    'countryCode': countryCode,
    'countryName': countryName,
    'regions': regions?.map((e) => e.toJson()).toList(),
  };
}

}