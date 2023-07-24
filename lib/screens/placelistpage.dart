import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/country/LocationMapPage.dart';
import 'package:gtk_flutter/screens/photoGallery.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../model/placehistory.dart';
import 'package:intl/intl.dart';

class PlaceHistoryListPage extends StatefulWidget {
  final String countrycode;
  final String regioncode;

  PlaceHistoryListPage({required this.countrycode, required this.regioncode});

  @override
  State<PlaceHistoryListPage> createState() => _PlaceHistoryListPageState();
}

class _PlaceHistoryListPageState extends State<PlaceHistoryListPage> {
  /// : super(key: key);
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Visted Location'),
        ),
        body: Center(
          child: PlaceHistorylist(
              countrycode: widget.countrycode, regioncode: widget.regioncode),
        ));
  }
}

class PlaceHistorylist extends StatefulWidget {
  final String countrycode;
  final String regioncode;

  PlaceHistorylist({required this.countrycode, required this.regioncode});

  @override
  State<PlaceHistorylist> createState() => _PlaceHistorylistState();
}

class _PlaceHistorylistState extends State<PlaceHistorylist> {
  final CurrentCountryCollectionReference countyRef =
      currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PlaceHistoryQuerySnapshot>(
        ref: countyRef
            .doc(widget.countrycode)
            .region
            .doc(widget.regioncode)
            .placehistory
            .orderByTimestamp(descending: true),
        builder: (context, AsyncSnapshot<PlaceHistoryQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong ${snapshot.error}!');
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

Widget placescard(PlaceHistory currentPlaceHistory, BuildContext context) {
  return Card(
    color: Color.fromARGB(255, 49, 52, 59),
    //shadowColor: Colors.blueAccent,
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(4),
          child: Column(
            // verticalDirection: VerticalDirection.up,
            //  mainAxisAlignment: MainAxisAlignment.center,
            // alignment: Alignment.center,
            children: [
              Text(
                currentPlaceHistory.region!,
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 173, 182),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(currentPlaceHistory.city!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                  )),

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
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentPlaceHistory.streetAddress!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                        (DateFormat('hh:mm a dd MMM yy')
                            .format(currentPlaceHistory.arrivaldate!)),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                        'Country vist number : ${currentPlaceHistory.visitnumber}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Distance: ${currentPlaceHistory.distance}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Lat : ${currentPlaceHistory.latitude}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Lng : ${currentPlaceHistory.longitude}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Dairy : ${currentPlaceHistory.description}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),



                        
             //     Container(child: Image.network(
             // currentPlaceHistory.imagePaths![1],
             // fit: BoxFit.cover,
           // ),
            //)
                        
                  ],
                ),
              )
            ],
          ),
        ),
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
                onPressed: () {
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
                child: Text(
                    style: TextStyle(color: Color.fromARGB(255, 26, 173, 182)),
                    'Show on map')),

            TextButton(
                onPressed: () {
                  if (currentPlaceHistory!.imagePaths!.isNotEmpty ) { 

                  Navigator.push(
                      context,
                      MaterialPageRoute(

                        builder: (context) =>  ImageGallery(
                            imagePaths: currentPlaceHistory.imagePaths!)
                        //ImageGallery( places: places
                        //documentId: 'Y9yviPMmXlk8eFfNRld3'
                        ,
                      )

                      //  countrycode: currentcountry.countryCode!),
                      //);
                      );
                  }
                },
                child: Text(
                    style: TextStyle(color: Color.fromARGB(255, 26, 173, 182)),
                    'Show Images'))
          ],
        )
      ],
    ),
  );
}
