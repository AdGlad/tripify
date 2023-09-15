import 'dart:io';

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/regionlistpage.dart';
import 'package:provider/provider.dart';
import '../model/topPoi.dart';
import '../state/applicationstate.dart';
import 'UserInfo/UserInfoPage.dart';
import 'poiMapContainer.dart';

import 'dart:developer' as developer;

//import 'country/poiCard.dart';

//import 'country/poiCard.dart';

class PoiList extends StatefulWidget {
  TopPoi poiToVisit;

  //   String groupId;

  PoiList({required this.poiToVisit});

  @override
  State<PoiList> createState() => _PoiListState();
}

class _PoiListState extends State<PoiList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ApplicationState>(
          builder: (context, appState, _) => Scaffold(
              appBar: AppBar(
                title: Text('Top ' + widget.poiToVisit.description!),
              ),
              body: FirestoreBuilder<PoiQuerySnapshot>(
                  //   return FirestoreBuilder<TopPoiQuerySnapshot>(
                  //  ref: poitovisitRef.doc(widget.poiToVisit.groupId).poi,
                  ref: toppoiRef.doc(widget.poiToVisit.groupId).poi,
                  // ref: poitovisitRef.doc('DUMMY'),
                  builder: (context, AsyncSnapshot<PoiQuerySnapshot> snapshot,
                      Widget? child) {
                    //   builder: (context, AsyncSnapshot<PoiQuerySnapshot> snapshot, Widget? child) {
                    if (snapshot.hasError) return Text('Something went wrong!');
                    if (!snapshot.hasData)
                      return Text('Loading poi-to-visit...');

                    // Access the QuerySnapshot
                    PoiQuerySnapshot querySnapshot = snapshot.requireData;
                    //        TopPoiQuerySnapshot querySnapshot = snapshot.requireData;

                    //  TopPoi querySnapshot = snapshot.requireData;

                    return ListView.builder(
                      itemCount: querySnapshot.docs.length,
                      itemBuilder: (context, index) {
                        // Access the User instance
                        //                TopPoi poiToVisit = querySnapshot.docs[index].data;

                        Poi poi = querySnapshot.docs[index].data;

                        return GestureDetector(
                          // child: Text("poi.properties!")
                          // child: PoitCard(poi, context) //Text(poi.properties?['name'])
                          child:
                              //Hero(
                              //     tag: "PointOfInterest2",
                              //     child:

                              PoitImageCard(
                                  poi: poi,
                                  context: context,
                                  poiList: appState.userProfile!.poi),
                          //            ), //Text(poi.properties?['name'])
                          //    child: Text(poiToVisit.description!)
                          onTap: () =>
                              //    developer.log('GestureDetector PointOfInterest ')
                              _PoiLocationPage(
                                  poi, appState.userProfile!.poi, context),
                        );
                      },
                    );
                  }))),
    );
  }
}

void _PoiLocationPage(
    Poi poi, List<Map<String, dynamic>>? poiList, BuildContext context) {
  List<String> _VistsToPoi = VistsToPoi(poi.poiId, poiList);
  bool _visited = checkPoi(poi.poiId, poiList);

  Navigator.of(context).push(
    MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: Text('Poi Visits'),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 1,
                    //  child:
                    //  Hero(
                    //    tag: "PointOfInterest1",
                    child: Container(
                        //  height: 50,
                        child: PoitHeroCard(
                            visited: _visited, poi: poi, context: context)),
                  ),
                  // ),
                  //  poiMapContainer(BuildContext: context,   Poi: poi
                  Expanded(
                    flex: 2,
                    child: poiMapContainer(context, poi
                        //latlng: LatLng(currentPlaceHistory.l//atitude!,
                        //currentPlaceHistory.longitude!
                        ),
                  ),
                  Expanded(
                      flex: 2,
                      child: //Container(color: Colors.blue,)
                          Container(
                        padding:
                            EdgeInsets.all(16.0), // Adjust padding as needed
                        child: ListView.builder(
                            itemCount: _VistsToPoi.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_VistsToPoi[index]),
                                // You can add more customization to ListTile if needed
                              );
                            }),
                      ))
                ],
              ),
            )),
  );
}

class PoitImageCard extends StatelessWidget {
  final Poi poi;
  final BuildContext context;
  final List<Map<String, dynamic>>? poiList;

  //const CheckInContainer({super.key});
  const PoitImageCard({required this.poi, required this.context, this.poiList});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, _) => FutureBuilder<File?>(
              future: (poi.poiId != null)
                  ? getImageFile(
                      'app/images/toplocations/' + poi.poiId + '.jpg')
                  : getImageFile(
                      'app/images/toplocations/' + 'Eiffel Tower' + '.jpg'),
              builder: (context, snapshot) {
                bool poihasbeenvisted = true;

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching the file.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No image available');
                } else {
                  final imageProvider = FileImage(snapshot.data!);
                  bool poihasbeenvisted = checkPoi(poi.poiId, poiList);
                  return Card(
                    color: (poihasbeenvisted)
                        ? Color.fromARGB(255, 251, 214, 6)
                        : Color.fromARGB(255, 49, 52, 59),
                    elevation: 8.0,
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          //  color: Color.fromARGB(255, 81, 126, 231),
                          margin: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              // Icon( Icons.location_on, color: Colors.white, size: 25),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 40.0,
                                        backgroundImage: imageProvider),
                                    Container(
                                      child: Text(poi.properties?['name']!,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: (poihasbeenvisted)
                                                ? Color.fromARGB(
                                                    255, 49, 52, 59)
                                                : Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ),
                                    //    Icon(Icons.star_border, color: Colors.white, size: 25),
                                    // (poihasbeenvisted) ? Icon(Icons.star, color: Colors.amber, size: 25) : Icon(Icons.star_border, color: Colors.white, size: 25),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ));
  }
}

List<String> VistsToPoi(String? poi_name, List<Map<String, dynamic>>? poiList) {
  // String? checkPoi(String? poi_name, List<Map<String, dynamic>>? poiList) {
  List<String> poivisits = [];
  // String? _plachistoryId;
  // int counter = 0;

  for (Map poiuser in poiList!) {
    if (poiuser['name'] == poi_name) {
      poivisits.add(poiuser['placeHistoryId']);
      //_plachistoryId = poiuser['placeHistoryId'];
      // developer.log('Already visited here for $poi_name   $_plachistoryId');
      developer.log('Already visited here for $poi_name ');
      //  counter = counter + 1;
    } else {
      developer.log('Not Already visited here for $poi_name');
    }
  }
  //return _plachistoryId;
  return poivisits;
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}

class PoitHeroCard extends StatelessWidget {
  final bool visited;
  final Poi poi;
  final BuildContext context;
  //const CheckInContainer({super.key});
  const PoitHeroCard(
      {required this.visited, required this.poi, required this.context});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, _) => FutureBuilder<File?>(
              future: (poi.poiId != null)
                  ? getImageFile(
                      'app/images/toplocations/' + poi.poiId + '.jpg')
                  : getImageFile(
                      'app/images/toplocations/' + 'Eiffel Tower' + '.jpg'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching the file.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No image available');
                } else {
                  final imageProvider = FileImage(snapshot.data!);
                  return Card(
                    color: (visited)
                        ? Color.fromARGB(255, 251, 214, 6)
                        : Color.fromARGB(255, 49, 52, 59),
                    elevation: 8.0,
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 40.0,
                                        backgroundImage: imageProvider),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            CountryFlag(poi.properties?['iso_3166_1']!),
                                            style: TextStyle(
                                              color: (visited)
                                                  ? Color.fromARGB(
                                                      255, 49, 52, 59)
                                                  : Colors.white,
                                              fontSize: 50.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(poi.properties?['name']!,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: (visited)
                                                    ? Color.fromARGB(
                                                        255, 49, 52, 59)
                                                    : Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ));
  }
}

bool checkPoi(String? poi_name, List<Map<String, dynamic>>? poiList) {
  // String? checkPoi(String? poi_name, List<Map<String, dynamic>>? poiList) {
  bool _exists = false;
  // String? _plachistoryId;

  for (Map poiuser in poiList!) {
    if (poiuser['name'] == poi_name) {
      _exists = true;
      //_plachistoryId = poiuser['placeHistoryId'];
      // developer.log('Already visited here for $poi_name   $_plachistoryId');
      developer.log('Already visited here for $poi_name ');
      break;
    } else {
      developer.log('Not Already visited here for $poi_name');
    }
  }
  //return _plachistoryId;
  return _exists;
}
