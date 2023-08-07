import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/country/LocationMapPage.dart';
import 'package:gtk_flutter/screens/photoGallery.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../model/placehistory.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_share/flutter_share.dart';


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
          title: Text('Visited Location'),
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
                        currentPlaceHistory.arrivaldate != null
                            ? 'Arrival Date: ' +
                                (DateFormat('hh:mm a dd MMM yy')
                                    .format(currentPlaceHistory.arrivaldate!))
                            : 'No arrival date',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Visit No. : ${currentPlaceHistory.visitnumber}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),

                    Text(
                        currentPlaceHistory.distance != null
                            ? 'Distance: ${currentPlaceHistory.distance}'
                            : 'no distance',
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
                    Text(
                        currentPlaceHistory.description != null
                            ? 'Diary : ${currentPlaceHistory.description}'
                            : 'Diary : ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: currentPlaceHistory.imagePaths?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: 
                              currentPlaceHistory.imagePaths?[index] != null ?
                              Image.file(File(currentPlaceHistory.imagePaths![index]))
                                   : Text(' '),
                            );
                          }),
                    )
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
              onPressed: () {
               // _fluttershareImages( currentPlaceHistory!);
              _shareImages( currentPlaceHistory!);
                },
              icon: const Icon(Icons.share),
              tooltip: 'Pics',
            ),
            IconButton(
              color: Color.fromARGB(255, 26, 173, 182),
              onPressed: () {
                if (currentPlaceHistory!.imagePaths!.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageGallery(
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
              icon: const Icon(Icons.image),
              tooltip: 'Share',
            ),
            IconButton(
              color: Color.fromARGB(255, 26, 173, 182),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LocationMapPage(placeHistory: currentPlaceHistory
                              //latlng: LatLng(currentPlaceHistory.l//atitude!,
                              //currentPlaceHistory.longitude!
                              )),
                  //  countrycode: currentcountry.countryCode!),
                );
              },
              icon: const Icon(Icons.map),
              tooltip: 'Map',
            ),
          ],
        )
      ],
    ),
  );
}
  void _shareImages(PlaceHistory currentPlaceHistory) async {
      final files = <XFile>[];

if (currentPlaceHistory.imagePaths != null) {
      for (var i = 0; i < currentPlaceHistory.imagePaths!.length; i++) {
        files.add(XFile(currentPlaceHistory.imagePaths![i], name: currentPlaceHistory.imagePaths![i]));
      }
}

    if (currentPlaceHistory.imagePaths != null) {

//final result = await Share.shareXFiles([XFile('/var/mobile/Containers/Data/Application/EAA8DD50-60C3-456C-8E0F-15DD007F930E/Documents/image_picker_6332C981-94B7-4B68-9F68-41257A7D429C-15817-00000898000C298E.jpg')], text: 'Great picture');

//final result = await Share.shareXFiles([XFile(imagePaths)], text: 'Great picture');
//final result = await Share.shareXFiles(files, text: currentPlaceHistory.streetAddress ,subject: 'In Australia',);
final result = await Share.shareXFiles(files, text: currentPlaceHistory.streetAddress ,subject: 'In Australia',
);

if (result.status == ShareResultStatus.success) {
    print('Thank you for sharing the picture!');
   // await Share.shareXFiles(imagePaths.cast<XFile>()
     // mimeTypes: List.filled(imagePaths!.length, 'image/jpeg'), // Specify mime types
     // text: 'Check out these images!', // Optional text message
   // );
      }
  }
  }

   void _fluttershareImages(PlaceHistory currentPlaceHistory) async {
      final files = <XFile>[];

    if (currentPlaceHistory.imagePaths != null) {
          await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: currentPlaceHistory.imagePaths![0],
    );

  }
  }