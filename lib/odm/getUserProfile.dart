import 'package:cloud_firestore/cloud_firestore.dart';

import 'userProfile.dart';


Future<UserProfileFull?> getUserProfile(String documentId) async {
  final docRef = FirebaseFirestore.instance.collection('users').doc(documentId);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    final userProfile = UserProfileFull.fromJson(docSnapshot.data() as Map<String, dynamic>);
    return userProfile;
  }
  return null;
}


// void main() async {
//   final repo = UserRepository();
//   final userList = await repo.getAllUsersWithDetails();

//   for (var user in userList) {
//     print("User ID: ${user.userId}");
//     for (var country in user.countries) {
//       print("  Country Name: ${country.countryName}");
//       for (var region in country.regions) {
//         print("    Region: ${region.region}");
//         for (var place in region.placehistory) {
//           print("      Place City: ${place.city}");
//           print("      Description: ${place.description}");
//         }
//       }
//     }
//   }
// }
