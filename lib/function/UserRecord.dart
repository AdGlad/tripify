import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/users.dart';

Future<UserProfile> userRecord(String userId) async {
  UserProfile userProfile;

  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  final snapshot = await userRef.get();
  userProfile = snapshot.data() as UserProfile;
  return userProfile;
} 