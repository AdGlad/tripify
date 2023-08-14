import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/usertotals.dart';
//import '../ActiveCountryPage.dart';
import 'dart:developer' as developer;

Future<void> updateStats(UserTotals userTotals) async {
    final user = FirebaseAuth.instance.currentUser;
    // await user?.updateDisplayName(_nicknameController.text);
    // await user!.updateDisplayName("you");
    developer.log(
        'Update users ${userTotals.CountryCount}, ${userTotals.VisitCount}, ${userTotals.DistanceTotal}, ${userTotals.RegionTotal}, ${userTotals.PlacesCount}');
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      'countrycount': userTotals.CountryCount ?? 0,
      'visitcount': userTotals.VisitCount ?? 0,
      'distancetotal': userTotals.DistanceTotal ?? 0,
      'regiontotal': userTotals.RegionTotal ?? 0,
      'placescount': userTotals.PlacesCount ?? 0,
    });
  }
  