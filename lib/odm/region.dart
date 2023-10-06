import 'placeHistory.dart';

class Region {
  final String? apiregionCode;
  final String? countryCode;
  final String? region;
  final String? regionCode;
  final List<PlaceHistory>? placehistory;

  Region({
    this.apiregionCode,
    this.countryCode,
    this.region,
    this.regionCode,
    this.placehistory,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        apiregionCode: json['apiregionCode'],
        countryCode: json['countryCode'],
        region: json['region'],
        regionCode: json['regionCode'],
        placehistory: (json['placehistory'] as List)
            .map((e) => PlaceHistory.fromJson(e))
            .toList(),
      );

      Map<String, dynamic> toJson() {
  return {
    'apiregionCode': apiregionCode,
    'countryCode': countryCode,
    'region': region,
    'regionCode': regionCode,
    'placehistory': placehistory?.map((e) => e.toJson()).toList(),
  };
}
}