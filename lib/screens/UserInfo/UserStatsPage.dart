import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:intl/intl.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;

  UserProfileScreen({required this.userId});

Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(String userId) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  final snapshot = await userRef.get();

  return snapshot;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserProfile(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred: ${snapshot.error.toString()}'),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('No user profile found'),
            );
          }

          final userProfile = snapshot.data!.data();

          return
          Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Statistics',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                       // Text( 'joinDate',
                        //  'Join Date: ${DateFormat('dd MMMM yyyy').format(appState.userProfile!.joinDate!)}',
                          Text('Join Date: ${DateFormat('dd MMMM yyyy').format((userProfile?['joinDate'] as Timestamp ).toDate())}',

                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                                child: buildCard(
                                   // appState.userProfile?.currentstreak,
                                    userProfile?['currentStreak'],
                                    'Days',
                                    Icons.local_fire_department,
                                    'Current Streak')),
                            SizedBox(width: 16.0),
                            Expanded(
                                child: buildCard(
                                  //  appState.userProfile?.distancetotal,
                                    userProfile?['distancetotal'],
                                    'Kms',
                                    Icons.run_circle,
                                    'Distance Travelled')),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                                child: buildCard(
                                   // appState.userProfile?.countrycount,
                                    userProfile?['countrycount'],
                                    '',
                                    Icons.map_outlined,
                                    'Countries Visted')),
                            SizedBox(width: 16.0),
                            Expanded(
                                child: buildCard(
                                   // appState.userProfile?.placescount,
                                    userProfile?['placescount'],
                                    '',
                                    Icons.place,
                                    'Check-ins')),
                          ],
                        ),
                      ],
                    ),
                  );
          
          //  Container(
          //   padding: EdgeInsets.all(16.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Name: ${userProfile?['nickname'] ?? 'N/A'}',
          //         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          //       ),
          //       SizedBox(height: 8.0),
          //       Text(
          //         'Email: ${userProfile?['email'] ?? 'N/A'}',
          //         style: TextStyle(fontSize: 16.0),
          //       ),
          //       // Add other user profile details you want to display
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
