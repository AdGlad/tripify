import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/placehistory.dart';

import '../model/users.dart';
// import 'package:gtk_flutter/screens/regionlistpage.dart';

// import '../model/placehistory.dart';

class League extends StatefulWidget {
  const League({super.key});

  @override
  State<League> createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  String MembershipLength(DateTime joindate) {
    final currentDate = DateTime.now();
    // final joinDate = joinDate;
    final duration = currentDate.difference(joindate);

    final months = duration.inDays ~/ 30;
    final years = duration.inDays ~/ 365;

    final durationString = years > 0 ? '$years+ years' : '$months+ months';

    return '$durationString';

    // return durationString ;
  }

 bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///  Container(
        //   child:
        Container(
          //             color: Color.fromARGB(255, 49, 52, 59),
          //  elevation: 8.0,
          margin: EdgeInsets.all(5.0),
          //  shape: RoundedRectangleBorder(
          //      borderRadius: BorderRadius.circular(15)),
          child: Card(
            // width:
            color: Color.fromARGB(255, 49, 52, 59),
            elevation: 8.0,
            margin: EdgeInsets.all(5.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("League Table",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center),
            ),
          ),
          // color: Colors.white,
        ),
//)
        Expanded(
          child: FirestoreBuilder<UserProfileQuerySnapshot>(
              ref: usersRef.orderByDistancetotal(descending: true),
              builder: (context,
                  AsyncSnapshot<UserProfileQuerySnapshot> snapshot,
                  Widget? child) {
                if (snapshot.hasError) return Text('Something went wrong!');
                if (!snapshot.hasData) return Text('Loading users...');

                // Access the QuerySnapshot
                UserProfileQuerySnapshot querySnapshot = snapshot.requireData;

                return ListView.builder(
                  itemCount: querySnapshot.docs.length,
                  itemBuilder: (context, index) {
                    // Access the User instance
                    UserProfile user = querySnapshot.docs[index].data;

                    return Card(
                      color: Color.fromARGB(255, 49, 52, 59),
                      elevation: 8.0,
                      margin: EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),

                      //padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                child: Container(
                                    //   color: Colors.blue,

                                    //alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    child: index == 0
                                        ? Icon(Icons.star_rounded,
                                            color: Colors.amber)
                                        : index == 1
                                            ? Icon(Icons.star_rounded,
                                                color: Colors.grey)
                                            : index == 2
                                                ? Icon(Icons.star_rounded,
                                                    color: Colors.brown)
                                                : Text('${index + 1}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ))),
                              ),
                              Container(
                                // color: Colors.white,
                                //  alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 10.0,
                                  backgroundImage: user.avatar == null
                                      ? null //FileImage(_imageFile)
                                      : user.avatar != null
                                          ? NetworkImage(user.avatar!)
                                          : null,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text('     ${user.nickname} ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(' ${user.distancetotal} Kms  ',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                        ' ${user.countrycount} Countries  ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                                                Container(
                                child: Text(MembershipLength(user.joinData!),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(icon: _isFavorite
              ? ColorFiltered(
                  child: Icon(Icons.favorite),
                  colorFilter: ColorFilter.mode(
                    Colors.red,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(Icons.favorite_border),
                                  
                                  
                                //  Icon(Icons.favorite_border),
                                  onPressed: () {
                                    setState(() {
              _isFavorite = !_isFavorite;
            });
                                  },),
                              )
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}

// class UsersPage extends StatefulWidget {
//   const UsersPage({super.key});

//   @override
//   State<UsersPage> createState() => _UsersPageState();
// }

// class _UsersPageState extends State<UsersPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: League(),
//     ));
//   }
// }

// class League extends StatelessWidget {
//   League();
//   final UsersCollectionReference countyRef =
//       currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

//   @override
//   Widget build(BuildContext context) {
//     return FirestoreBuilder<UsersQuerySnapshot>(
//         ref: countyRef,
//         builder: (context, AsyncSnapshot<UsersQuerySnapshot> snapshot,
//             Widget? child) {
//           if (snapshot.hasError) return Text('Something went wrong!');
//           if (!snapshot.hasData) return Text('Loading user...');

//           // Access the UserDocumentSnapshot
//           UsersQuerySnapshot querySnapshot = snapshot.requireData;
//           return ListView.builder(
//             itemCount: querySnapshot.docs.length,
//             itemBuilder: (context, index) {
//               // Access the User instance
//               Users Users = querySnapshot.docs[index].data;

//               return GestureDetector(
//                 child: countrycard(Users, context),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RegionListPage(
//                           countrycode: Users.countryCode!),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         });
//   }
// }

// // String CountryFlag(String countryCode) {
// //   String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
// //       (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
// //   return flag;
// // }

// Widget countrycard(Users country, BuildContext context) {
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
