import 'package:cloud_firestore/cloud_firestore.dart';

import 'userProfile.dart';


Future<UserProfile?> getUserProfile(String documentId) async {
  final docRef = FirebaseFirestore.instance.collection('users').doc(documentId);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    final userProfile = UserProfile.fromJson(docSnapshot.data() as Map<String, dynamic>);
    return userProfile;
  }
  return null;
}

