import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/placelistpage.dart';

import '../model/placehistory.dart';

class RegionListPage extends StatefulWidget {
  final String countrycode;

  RegionListPage({required this.countrycode});

  @override
  State<RegionListPage> createState() => _RegionListPageState();
}

class _RegionListPageState extends State<RegionListPage> {
  /// : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Regions Visted'),
        ),
        body: Center(
          child: Regionlist(countrycode: widget.countrycode),
        )
        // ListView(
        //   children: <Widget>[
        //     ListTile(
        //       title: Text(widget.item),
        //       subtitle: Text('This is the detail page for country ${widget.item}'),
        //     ),
        //   ],
        // ),

        );
  }
}

class Regionlist extends StatefulWidget {
  final String countrycode;

  Regionlist({required this.countrycode});

  @override
  State<Regionlist> createState() => _RegionlistState();
}

class _RegionlistState extends State<Regionlist> {
  //Regionlist();
  final CurrentCountryCollectionReference countyRef =
      currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

  //final RegionCollectionReference regionRef = currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country.doc(widget.countrycode).region;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<RegionQuerySnapshot>(
        ref: countyRef.doc(widget.countrycode).region,
        builder: (context, AsyncSnapshot<RegionQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading user...');

          // Access the UserDocumentSnapshot
          RegionQuerySnapshot querySnapshot = snapshot.requireData;
          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              Region currentregion = querySnapshot.docs[index].data;

              return GestureDetector(
                child: regioncard(currentregion, context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceHistoryListPage(
                          countrycode: currentregion.countryCode!,
                          regioncode: currentregion.regionCode,// regionCode,
                          userid: FirebaseAuth.instance.currentUser!.uid),
                    ),
                  );
                },
              );
              //  ListTile(
              //   title: Text('${currentregion.region}'),
              //   subtitle: Text(' ${currentregion.countryCode}'),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => PlaceHistoryListPage(
              //             countrycode: currentregion.countryCode!,
              //             regioncode: currentregion.regionCode!),
              //       ),
              //     );
              //   },
              // );
            },
          );
        });
  }
}

Widget regioncard(Region region, BuildContext context) {
  return Card(
    color: Color.fromARGB(255, 49, 52, 59),
    elevation: 8.0,
    // shadowColor: Colors.blueAccent,
    margin: EdgeInsets.all(5.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(4),
          child: Row(
            // alignment: Alignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(8, 0, 0, 0), // all(8.0),
              //   child: Text(
              //     CountryFlag(region.countryCode!),
              //     style: TextStyle(fontSize: 60),
              //   ),
              // ),
              // Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Text(
              //       CountryFlag(country.countryCode),
              //       style: TextStyle(fontSize: 50),
              //     )
              //     //  Image.network(
              //     //   image,
              //     //   height: MediaQuery.of(context).size.width * (3 / 4),
              //     //   width: MediaQuery.of(context).size.width,
              //     // ),

              //     ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(30, 0, 0, 0), //all(8.0),
              //   child: Text(
              //     region.region!,
              //     style: TextStyle(
              //       fontSize: 30.0,
              //     //  fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              Text(
                CountryFlag(region.countryCode!),
                style: TextStyle(fontSize: 30),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(region.region!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )),
//                     Text("Captial: \t\t" + country.capital!,
//                         // textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12.0,
// //                          fontWeight: FontWeight.w700,
//                         )),
//                     Text("Currency: \t" + country.currencyname!,
//                         // textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12.0,
// //                          fontWeight: FontWeight.w700,
//                         )),
                  ],
                ),
              )
            ],
          ),
        ),
        //SizedBox(
        //  height: 8,
        //),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            IconButton(
              color: Color.fromARGB(255, 26, 173, 182),
              onPressed: () {},
              icon: const Icon(Icons.share),
              tooltip: 'Share',
            ),
            //child: Text('SHARE')),
            TextButton(
                onPressed: () {},
                child: Text(
                    style: TextStyle(color: Color.fromARGB(255, 26, 173, 182)),
                    'Learn More'))
            //  ],
            //  )
          ],
        ),
      ],
    ),
  );
}

String CountryFlag(String countryCode) {
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}
