// import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:gtk_flutter/model/placehistory.dart';
// import 'package:gtk_flutter/screens/regionlistpage.dart';

// Widget countrycard(CurrentCountry country, BuildContext context) {
//   return Card(
//     color: Color.fromARGB(255, 49, 52, 59),
//     elevation: 8.0,
//     margin: EdgeInsets.all(5.0),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     child: Column(
//       children: [
//         Container(
//           margin: EdgeInsets.all(4),
//           child: Row(
//             children: [
//               Text(
//                 CountryFlag(country.countryCode),
//                 style: TextStyle(fontSize: 30),
//               ),
//               Container(
//                 margin: EdgeInsets.all(5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(country.countryName!,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                         )),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         ButtonBar(
//           alignment: MainAxisAlignment.end,
//           children: [
//             IconButton(
//               color: Color.fromARGB(255, 26, 173, 182),
//               onPressed: () {},
//               icon: const Icon(Icons.share),
//               tooltip: 'Share',
//             ),
//             //child: Text('SHARE')),
//             TextButton(
//                 onPressed: () {},
//                 child: Text(
//                     style: TextStyle(color: Color.fromARGB(255, 26, 173, 182)),
//                     'Learn More'))
//           ],
//         )
//       ],
//     ),
//   );
// }

// class UserCountrylist extends StatelessWidget {
//   UserCountrylist();
//   final CurrentCountryCollectionReference countyRef =
//       currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

//   @override
//   Widget build(BuildContext context) {
//     return FirestoreBuilder<CurrentCountryQuerySnapshot>(
//         ref: countyRef,
//         builder: (context, AsyncSnapshot<CurrentCountryQuerySnapshot> snapshot,
//             Widget? child) {
//           if (snapshot.hasError) return Text('Something went wrong!');
//           if (!snapshot.hasData) return Text('Loading user...');

//           // Access the UserDocumentSnapshot
//           CurrentCountryQuerySnapshot querySnapshot = snapshot.requireData;
//           return ListView.builder(
//             itemCount: querySnapshot.docs.length,
//             itemBuilder: (context, index) {
//               // Access the User instance
//               CurrentCountry currentcountry = querySnapshot.docs[index].data;

//               return GestureDetector(
//                 child: countrycard(currentcountry, context),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RegionListPage(
//                           countrycode: currentcountry.countryCode!),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         });
//   }
// }

// class UserStats extends StatefulWidget {
//   const UserStats({super.key});

//   @override
//   State<UserStats> createState() => _UserStatsState();
// }

// class _UserStatsState extends State<UserStats> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Container(
//             child: countrycard(
//                 CurrentCountry(countryCode: 'AUS', countryName: 'Australia'),
//                 context)),
//         // Text('UserStats')),
//         Container(child: UserCountrylist())
//       ],
//     );
//   }
// }
