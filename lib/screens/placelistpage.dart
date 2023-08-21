import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/country/LocationMapPage.dart';
import 'package:path_provider/path_provider.dart';
import '../model/placehistory.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../src/firebaseImage.dart';

class PlaceHistoryListPage extends StatefulWidget {
  final String countrycode;
  final String regioncode;
  final String userid;

  PlaceHistoryListPage(
      {required this.countrycode,
      required this.regioncode,
      required this.userid});

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
              countrycode: widget.countrycode,
              regioncode: widget.regioncode,
              userid: widget.userid),
        ));
  }
}

class PlaceHistorylist extends StatefulWidget {
  final String countrycode;
  final String regioncode;
  final String userid;

  PlaceHistorylist(
      {required this.countrycode,
      required this.regioncode,
      required this.userid});

  @override
  State<PlaceHistorylist> createState() => _PlaceHistorylistState();
}

class _PlaceHistorylistState extends State<PlaceHistorylist> {
  // final CurrentCountryCollectionReference countyRef =
  //  currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;
  //  currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PlaceHistoryQuerySnapshot>(
        ref: currentuserRef
            .doc(widget.userid)
            .country
            .doc(widget.countrycode)
            .region
            .doc(widget.regioncode)
            .placehistory
            //.doc(widget.regioncode)
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
  late Reference _storageReference;
  _storageReference = FirebaseStorage.instance
      .ref()
      .child(FirebaseAuth.instance.currentUser!.uid);

  return Card(
    color: Color.fromARGB(255, 49, 52, 59),
    //shadowColor: Colors.blueAccent,
    elevation: 8.0,
    margin: EdgeInsets.all(2.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(2),
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
                    // Center Row in middle
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center row horizontally
                      children: [
                        Text('Visit No. : ${currentPlaceHistory.visitnumber}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                            )),
                        Text(
                            currentPlaceHistory.distance != null
                                ? '  Distance: ${currentPlaceHistory.distance}'
                                : 'no distance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),

                    Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center row horizontally

                      children: [
                        Text('Lat : ${currentPlaceHistory.latitude}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                            )),
                                               Text('  Lng : ${currentPlaceHistory.longitude}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        )),
                      ],
                    ),
 
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
                      height: 100,
                      child:
                          //                        ListView.builder(
                          //   itemCount: currentPlaceHistory.imagePaths?.length,
                          //   itemBuilder: (context, index) {
                          //     return FutureBuilder(
                          //       future: _storageReference.child(currentPlaceHistory.imagePaths![index]).getDownloadURL(),
                          //       builder: (context, snapshot) {
                          //         if (snapshot.connectionState == ConnectionState.waiting) {
                          //           return CircularProgressIndicator();
                          //         } else if (snapshot.hasError) {
                          //           return Text('Error: ${snapshot.error}');
                          //         } else if (snapshot.hasData) {
                          //           String imageUrl = snapshot.data.toString();
                          //           return ListTile(
                          //             title: Text('Image ${index + 1}'),
                          //             leading: Image.network(imageUrl),
                          //           );
                          //         } else {
                          //           return Text('No image available.');
                          //         }
                          //       },
                          //     );
                          //   },
                          // ),
                          // ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: currentPlaceHistory.imagePaths?.length,
                          //     itemBuilder: (context, index) {
                          //       return Padding(
                          //         padding: EdgeInsets.all(8.0),
                          //         child:
                          //         currentPlaceHistory.imagePaths?[index] != null ?
                          //         Image.file(File(currentPlaceHistory.imagePaths![index]))
                          //              : Text(' '),
                          //       );
                          //     }),
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: currentPlaceHistory.imagePaths?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: currentPlaceHistory
                                                .imagePaths?[index] !=
                                            null
                                        ? FirebaseImage(
                                            storagePath: currentPlaceHistory
                                                .imagePaths![index])
                                        : Text(' '),
                                  ),
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
                _shareImages(currentPlaceHistory);
              },
              icon: const Icon(Icons.share),
              tooltip: 'Share',
            ),
            // IconButton(
            //   color: Color.fromARGB(255, 26, 173, 182),
            //   onPressed: () {
            //     if (currentPlaceHistory!.imagePaths!.isNotEmpty) {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => ImageGallery(
            //                 imagePaths: currentPlaceHistory.imagePaths!)
            //             //ImageGallery( places: places
            //             //documentId: 'Y9yviPMmXlk8eFfNRld3'
            //             ,
            //           )

            //           //  countrycode: currentcountry.countryCode!),
            //           //);
            //           );
            //     }
            //   },
            //   icon: const Icon(Icons.image),
            //   tooltip: 'Pics',
            // ),
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
  final tempDir = await getTemporaryDirectory();

  if (currentPlaceHistory.imagePaths != null) {
    for (var i = 0; i < currentPlaceHistory.imagePaths!.length; i++) {
      final storagePath = currentPlaceHistory.imagePaths![i];

      final fileName = storagePath.split('/').last;
      final file = File('${tempDir.path}/$fileName');

      //  FirebaseImage(storagePath: currentPlaceHistory.imagePaths![i]).storagePath;

      files.add(XFile(file.path, name: fileName));
//        files.add(XFile(currentPlaceHistory.imagePaths![i], name: currentPlaceHistory.imagePaths![i]));
      //   files.add(XFile((FirebaseImage(storagePath: currentPlaceHistory.imagePaths![i])).path, name: FirebaseImage(storagePath: currentPlaceHistory.imagePaths![i]).storagePath));
    }
  }

  if (currentPlaceHistory.imagePaths != null) {
//final result = await Share.shareXFiles([XFile('/var/mobile/Containers/Data/Application/EAA8DD50-60C3-456C-8E0F-15DD007F930E/Documents/image_picker_6332C981-94B7-4B68-9F68-41257A7D429C-15817-00000898000C298E.jpg')], text: 'Great picture');

//final result = await Share.shareXFiles([XFile(imagePaths)], text: 'Great picture');
//final result = await Share.shareXFiles(files, text: currentPlaceHistory.streetAddress ,subject: 'In Australia',);
    final result = await Share.shareXFiles(
      files,
      text: currentPlaceHistory.streetAddress,
      subject: 'In Australia',
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
