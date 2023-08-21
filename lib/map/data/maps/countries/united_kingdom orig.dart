import 'package:flutter/material.dart';

class SMapUnitedKingdomColors {
  /// North East
  final Color? gbUKC;

  /// North West
  final Color? gbUKD;

  /// Yorkshire and the Humber
  final Color? gbUKE;

  /// East Midlands
  final Color? gbUKF;

  /// West Midlands
  final Color? gbUKG;

  /// East of England
  final Color? gbUKH;

  /// Greater London
  final Color? gbUKI;

  /// South East
  final Color? gbUKJ;

  /// South West
  final Color? gbUKK;

  /// Wales
  final Color? gbUKL;

  /// Scotland
  final Color? gbUKM;

  /// Northern Ireland
  final Color? gbUKN;

  /// Guernsey
  final Color? ggGG;

  /// Jersey
  final Color? jeJE;

  /// Isle of Man
  final Color? imIM;

  /// Ireland
  final Color? ieIE;
  SMapUnitedKingdomColors({
    this.gbUKC,
    this.gbUKD,
    this.gbUKE,
    this.gbUKF,
    this.gbUKG,
    this.gbUKH,
    this.gbUKI,
    this.gbUKJ,
    this.gbUKK,
    this.gbUKL,
    this.gbUKM,
    this.gbUKN,
    this.ggGG,
    this.jeJE,
    this.imIM,
    this.ieIE,
  });
  Map<String, Color?> toMap() {
    return {
      "GB-UKC": gbUKC,
      "GB-UKD": gbUKD,
      "GB-UKE": gbUKE,
      "GB-UKF": gbUKF,
      "GB-UKG": gbUKG,
      "GB-UKH": gbUKH,
      "GB-UKI": gbUKI,
      "GB-UKJ": gbUKJ,
      "GB-UKK": gbUKK,
      "GB-UKL": gbUKL,
      "GB-SCT": gbUKM,
      "GB-UKN": gbUKN,
      "GG-GG": ggGG,
      "JE-JE": jeJE,
      "IM-IM": imIM,
      "IE-IE": ieIE,
    };
  }

  static SMapUnitedKingdomColors fromMap(Map<String, Color?> map) {
    return SMapUnitedKingdomColors(
      gbUKC: map["GB-UKC"],
      gbUKD: map["GB-UKD"],
      gbUKE: map["GB-UKE"],
      gbUKF: map["GB-UKF"],
      gbUKG: map["GB-UKG"],
      gbUKH: map["GB-UKH"],
      gbUKI: map["GB-UKI"],
      gbUKJ: map["GB-UKJ"],
      gbUKK: map["GB-UKK"],
      gbUKL: map["GB-UKL"],
      gbUKM: map["GB-SCT"],
      gbUKN: map["GB-UKN"],
      ggGG: map["GG-GG"],
      jeJE: map["JE-JE"],
      imIM: map["IM-IM"],
      ieIE: map["IE-IE"],
    );
  }
}

class SMapUnitedKingdom {
  static const String instructions =
}