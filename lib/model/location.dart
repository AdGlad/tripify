class LocationHistory {
  // String? get arrivalDate {
  //   DateTime? _arrivaldate;
  //   _arrivaldate = DateFormat.yMMMMEEEEd().format(this.arrivaldate).toString();
  //   return this.arrivaldate;
  // }

  LocationHistory({
    this.userId,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.streetAddress,
    this.city,
    this.countryName,
    this.countryCode,
    this.postal,
    this.region,
    this.timezone,
    this.elevation,
    this.timestamp,
    this.arrivaldate,
  });
  String? userId;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? streetAddress;
  String? city;
  String? countryName;
  String? countryCode;
  String? postal;
  String? region;
  String? regionCode;
  String? timezone;
  int? elevation;
  int? timestamp;
  DateTime? arrivaldate;
}
