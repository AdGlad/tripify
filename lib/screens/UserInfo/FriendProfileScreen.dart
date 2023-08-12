import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/placehistory.dart';
import '../../model/users.dart';
import '../../state/applicationstate.dart';
import '../checkIn/UserMapContainer.dart';
import '../country/LocationMapPage.dart';
import '../placelistpage.dart';
import '../../model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // new

class FriendProfileScreen extends StatelessWidget {
  FriendProfileScreen(this.id);
  final String id;
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<UserProfileDocumentSnapshot>(
      // Access a specific document
      ref: usersRef.doc(id),
      builder: (context, AsyncSnapshot<UserProfileDocumentSnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading user...');

        // Access the UserDocumentSnapshot
        UserProfileDocumentSnapshot documentSnapshot = snapshot.requireData;

        // if (!documentSnapshot.exists) {
        //     _showMyDialog(context);

        //   //Text('User does not exist.');
        // } else
        // {


        UserProfile? userprofile = documentSnapshot.data!;
        return Container(
        child: Scaffold(
                appBar: AppBar(
                  title: Text('${userprofile?.nickname??' '} Stats'),
                ),
                body: ListView(
                      children: [
                        Container(height: 150 ,  child: userStatsContainer(userprofile, context)),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              
                             // 'Statistics for ${appState.userProfile!.nickname}',
                              'Lastest location for ${userprofile?.nickname??' '}',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        Container( height: 400 ,  child: Expanded( flex: 1, child: FriendPlaceHistorylist(countrycode: userprofile.latestcountryCode,regioncode: userprofile.latestregionCode!, userid: userprofile.id))),
                        Container(height: 400 , child: Expanded( flex: 1, child: UserMapContainer(context, userprofile))),                      ]
                      ),
                )
                    
                    );
                    
      }
   //   }
        //return Text('User name: ${userprofile.}, age ${userprofile.age}');
    
    

    );




  }
  

}

class FriendPlaceHistorylist extends StatefulWidget {
  final String? countrycode;
  final String? regioncode;
  final String? userid;
  
  FriendPlaceHistorylist({required this.countrycode, required this.regioncode, required this.userid
  });

  @override
  State<FriendPlaceHistorylist> createState() => _FriendPlaceHistorylistState();
}

class _FriendPlaceHistorylistState extends State<FriendPlaceHistorylist> {

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PlaceHistoryQuerySnapshot>(
      //  ref: countyRef
        ref: currentuserRef.doc(widget.userid).country
            .doc(widget.countrycode)
            .region
            .doc(widget.regioncode)
            .placehistory
            .orderByTimestamp(descending: true)
            .limit(1),
        builder: (context, AsyncSnapshot<PlaceHistoryQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError)
            return Text('Something went wrong ${snapshot.error}!');
          if (!snapshot.hasData) return Text('Loading user...');

          // Access the UserDocumentSnapshot
          PlaceHistoryQuerySnapshot querySnapshot = snapshot.requireData;
          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              PlaceHistory currentPlaceHistory = querySnapshot.docs[index].data;

              return GestureDetector(
                child: placescard(currentPlaceHistory, context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationMapPage(
                            placeHistory: currentPlaceHistory
                            //latlng: LatLng(currentPlaceHistory.l//atitude!,
                            //currentPlaceHistory.longitude!
                            )),
                    //  countrycode: currentcountry.countryCode!),
                  );
                },
              );
              //  ListTile(
              //   title: Text('${currentPlaceHistory.streetAddress}'),
              //   subtitle: Text('${currentPlaceHistory.city}'),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => PlaceHistoryListPage(
              //             countrycode: currentPlaceHistory.countryCode!,
              //             regioncode: currentPlaceHistory.region!),
              //       ),
              //     );
              //   },
              // );
            },
          );
        });
  }
  
}

// class FriendProfileScreen extends StatelessWidget {
//   final String userId;

//   FriendProfileScreen({required this.userId});

//   // Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(
//   //     String userId) async {
//   //   final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
//   //   final snapshot = await userRef.get();

//   // return snapshot;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Consumer<ApplicationState>(
//             builder: (context, appState, _) => Scaffold(
//                 appBar: AppBar(
//                   title: Text('Friend Stats'),
//                 ),
//                 body: Column(
//                     // PlaceHistorylist(
//                     // countrycode: widget.countrycode, regioncode: widget.regioncode, userid: widget.userid),
//                     children: [
//                       Expanded(
//                           flex: 1,
//                           child: userStatsContainer(
//                               appState.userProfile, context)),
//                       // userStatsContainer(_userProfile, context),
//                       //  UserMapContainer( context, _userProfile!, null)
//                       //Container(child: UserMapContainer( context, _userProfile!))
//                       Expanded(
//                           flex: 1,
//                           child:
//                               UserMapContainer(context, appState.userProfile))
//                     ]))));
//   }
// }
Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}