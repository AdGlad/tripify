import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:gtk_flutter/screens/country/countryCard.dart';
import 'package:gtk_flutter/screens/countryPage.dart';
import 'package:provider/provider.dart';

import '../../model/placehistory.dart';
import '../../state/applicationstate.dart';

class UserCountryPage extends StatefulWidget {
  const UserCountryPage({super.key});

  @override
  State<UserCountryPage> createState() => _UserCountryPageState();
}

class _UserCountryPageState extends State<UserCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: UserCountrylist(),
    ));
  }
}

class UserCountrylist extends StatelessWidget {
  UserCountrylist();
  final CurrentCountryCollectionReference countryRef =
      currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<CurrentCountryQuerySnapshot>(
        ref: countryRef,
        builder: (context, AsyncSnapshot<CurrentCountryQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading user...');

          // Access the UserDocumentSnapshot
          CurrentCountryQuerySnapshot querySnapshot = snapshot.requireData;
          return 
          
          Consumer<ApplicationState>(
                    builder: (context, appState, _) => 
          Container(
            child: 
              Column(
                children: [
                  Container( height: 300,
                    child: ActiveCountryPage()),
                  Flexible(
                    child: ListView.builder(
                      itemCount: querySnapshot.docs.length,
                      itemBuilder: (context, index) {
                        // Access the User instance
                        CurrentCountry currentcountry = querySnapshot.docs[index].data;
                  
                        return GestureDetector(
                          child: countrycard(currentcountry, context),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => 
                                        CountryPage(
                                            country: currentcountry.countryCode,
                                            regionrecords: appState.regionrecords,
                                                    ),
                                
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            
          ));




        });
  }
}