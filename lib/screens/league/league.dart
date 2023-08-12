import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/placehistory.dart';
import '../../model/users.dart';
import 'leagueTitle.dart';

import 'dart:io'; 


// import 'package:gtk_flutter/screens/regionlistpage.dart';

// import '../model/placehistory.dart';

class League extends StatefulWidget {
  const League({super.key});

  @override
  State<League> createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        leagueTitleContainer(),
        Expanded(
          child: FirestoreBuilder<UserProfileQuerySnapshot>(
              ref: usersRef.orderByDistancetotal(descending: true),
              builder: (context,
                  AsyncSnapshot<UserProfileQuerySnapshot> snapshot,
                  Widget? child) {
                if (snapshot.hasError) return Text('Something went wrong! ${snapshot.error}');
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
                              Expanded(flex: 1, child: leaguePosition(index)),
                              Expanded(flex: 1, child: avatar(user.avatar, 10.0)),
                             // Expanded(child: leagueCountry(user)),
                              Expanded(flex: 4, child: leagueNickname(user)),
                              Expanded(flex: 4,child: leagueDistance(user)),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Column(
                          //       children: [
                          //         leagueCountry(user),
                          //         leagueMembership(user),
                          //       ],
                          //     ),
                          //     // )
                          //   ],
                          // ),
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

Widget leaguePosition(int index) {
  return Container(
    width: 50,
    child: Container(
        //   color: Colors.blue,

        //alignment: Alignment.centerLeft,
        width: double.infinity,
        child: index == 0
            ? Icon(Icons.star_rounded, color: Colors.amber, size: 25,)
            : index == 1
                ? Icon(Icons.star_rounded, color: Colors.grey,size: 25,)
                : index == 2
                    ? Icon(Icons.star_rounded, color: Colors.brown,size: 25,)
                    : Text('${index + 1}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ))),
  );
}

Widget avatar(String? _useravatar, double _radius ) {
  return Container(
    alignment: Alignment.centerLeft,
    child: CircleAvatar( 
     // radius: 10.0,
      radius: _radius,
      backgroundColor: Colors.blue,
      backgroundImage: 
      //NetworkImage('https://lh3.googleusercontent.com/a/AGNmyxZy7z0QoagLZwV8FobJdI0m1dezAfH0l9f81pz9=s96-c')
      //AssetImage('assets/Quokka-PNG-Pic.png')
      // FileImage(File('assets/quokka1.png')),
      // new AssetImage('assets/quokka1.png')
      _useravatar != null
          ? NetworkImage(_useravatar)
          :  AssetImage('assets/quokka1.png') as ImageProvider
//          : FileImage(File('assets/quokka1.png'))
        //  Image(image:  new AssetImage('assets/quokka1.png'))
          //: AssetImage('assets/quokka1.png') as ImageProvider
          //Image.asset('assets/quokka1.png')
          //null //FileImage(_imageFile)
        //  : useravatar != null
       //       : NetworkImage(useravatar)
             // : null,
    ),
  );
}

Widget leagueDistance(UserProfile user) {
  return Container(
      //  color: Colors.amber,

    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(' ${(user.distancetotal??0).toInt()} km',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.w700,
          )),
    ),
  );
}

Widget leagueNickname(UserProfile user) {
  return Container(
   // margin: EdgeInsets.all(0.0),
   // color: Colors.amber,
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Text('     ${user.nickname} ',
        overflow: TextOverflow.ellipsis,
      maxLines: 1,
      
          textAlign: TextAlign.left,
          style: TextStyle(
    
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.w700,
          )),
    ),
  );
}

Widget leagueCountry(UserProfile user) {
  return Container(
    child: Text(' ${user.countrycount} Countries  ',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.0,
          fontWeight: FontWeight.w700,
        )),
  );
}

Widget leagueMembership(UserProfile user) {
  String membershipLength(DateTime joindate) {
    final currentDate = DateTime.now();
    // final joinDate = joinDate;
    final duration = currentDate.difference(joindate);

    final months = duration.inDays ~/ 30;
    final years = duration.inDays ~/ 365;

    final durationString = years > 0 ? '$years+ years' : '$months+ months';

    return '$durationString';

    // return durationString ;
  }

  return Container(
    child: Text(membershipLength(user.joinDate!),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.0,
          fontWeight: FontWeight.w700,
        )),
  );
}

// Widget leagueFriend(UserProfile user) {
//     bool _isFavorite = false;
//   return
//                                Container(
//                                 alignment: Alignment.centerRight,
//                                 child: IconButton(
//                                   icon: _isFavorite
//                                       ? ColorFiltered(
//                                           child: Icon(Icons.favorite),
//                                           colorFilter: ColorFilter.mode(
//                                             Colors.red,
//                                             BlendMode.srcIn,
//                                           ),
//                                         )
//                                       : Icon(Icons.favorite_border),

//                                   //  Icon(Icons.favorite_border),
//                                   onPressed: () {}
//                                  //   setState(() {
//                                  //     _isFavorite = !_isFavorite;
//                                  //   }
                                
//                                     );
//                                   },
//                                 );
//                                 }
                              //)
        