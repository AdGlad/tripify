import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/placehistory.dart';
import '../model/topPoi.dart';
import '../src/fetchplacehistorydoc.dart';
import '../state/applicationstate.dart';
import 'UserInfo/UserInfoPage.dart';
import 'placelistpage.dart';
import 'dart:developer' as developer;

import 'topPoi.dart';

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
                            child: Hero(
                                tag: "PointOfInterest",
                                child: 
                                PoitImageCard(
                                    poi: poi,
                                    context: context,
                                    poiList: appState.userProfile!
                                        .poi)
                                        ), //Text(poi.properties?['name'])
                            //    child: Text(poiToVisit.description!)
                            onTap: () => 
                                 //    developer.log('GestureDetector PointOfInterest ')
                            _PoiLocationPage(
                                poi,
                                appState.userProfile!.poi,
                                 context),
                             // child: PoiCard(poi, context)

                            // ,onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //                       builder: (context) => PoiLocation(poi: poi, poiList:  appState.userProfile!.poi,context: context)
                            //                 ),
                            //       );
                            // }
                            );
                      },
                    );
                  }))),
    );
  }
}

// Widget PoitCard(Poi poi, BuildContext context) {
//   return Card(

//     color: Color.fromARGB(255, 49, 52, 59),
//     elevation: 8.0,
//     margin: EdgeInsets.all(5.0),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     child: Column(
//       children: [
//         Container(
//         //  color: Color.fromARGB(255, 81, 126, 231),
//           margin: EdgeInsets.all(5),
//           child: Row(
//             children: [
//               Icon( Icons.location_on, color: Colors.white, size: 25),
//             //  Icon(icon: Icons.location_on, color: Colors.white, size: 25),
//             //  Text(
//             //    CountryFlag(country.countryCode),
//             //    style: TextStyle(fontSize: 25),
//             //  ),
//               Container(
//               //            color: Color.fromARGB(255, 81, 126, 231),

//                 margin: EdgeInsets.all(5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(poi.properties?['name']!,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                         )),
//                         Icon(Icons.star_border, color: Colors.white, size: 25),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

void _PoiLocationPage(
    Poi poi, List<Map<String, dynamic>>? poiList, BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: Text('Second Page'),
              ),
              body:  Hero(
                    tag: "PointOfInterest",
                    child: Container(
                height: 150,
                child:
                    PoitImageCard(
                        poi: poi, context: context, poiList: poiList)),
              ),
            )),
  );
}

class PoiLocation extends StatelessWidget {
  Poi poi;
  List<Map<String, dynamic>>? poiList;
  final BuildContext context;

  // const poiLocatoion({Key? key}) : super(key: key);
  //  PoiLocation({ this.placehistoryId, required this.context});
  PoiLocation({required this.poi, this.poiList, required this.context});

  //PlaceHistory? poiPlaceHistory = await fetchPlacehistoryDoc( poi.poiId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Screen'),
        ),
        body: Container(
            height: 150,
            child: Hero(
                tag: "PointOfInterestq",
                child: PoitImageCard(
                    poi: poi, context: context, poiList: poiList)))
        //topPoiCard(TopPoi poi, BuildContext: context)
        //  Text('PoiLocation ${poi.poiId}'),

        );
    // ));
    // );
  }
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
              //  future:  ('London Eye' !=null) ? getImageFile('app/images/toplocations/' + 'London Eye' + '.jpg') : getImageFile('app/images/toplocations/' + 'Eiffel Tower' + '.jpg'),
              builder: (context, snapshot) {
                // PlaceHistory poiPlaceHistory= appState.placeHistory!.firstWhere((element) => element.poiId == poi.poiId);
                // PlaceHistory poiPlaceHistory= appState.placeHistory.first; //[poi.poiId!];

                // PlaceHistory? poiPlaceHistory = await fetchPlacehistoryDoc( poi.poiId);
                bool poihasbeenvisted = true;

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching the file.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No image available');
                } else {
                  // Create an ImageProvider from the fetched File.
                  final imageProvider = FileImage(snapshot.data!);
                  // String? vistedPlacehistoryId = checkPoi(poi.poiId, poiList);
                  bool poihasbeenvisted = checkPoi(poi.poiId, poiList);

                  // if (vistedPlacehistoryId == null)
                  //  {
                  //    poihasbeenvisted = false;
                  //  }
                  //  else{
                  //    poihasbeenvisted = true;

                  //  }
                  // Use the imageProvider with an Image widget or any other widget that accepts an ImageProvider.
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
                    // GestureDetector(
                    //         onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //     //      builder: (context) => PoiLocation(placehistoryId: vistedPlacehistoryId,context: context) // placescard(poiPlaceHistory, context)
                    //           builder: (context) => PoiLocation(poi: poi,poiList:  poiList,context: context) // placescard(poiPlaceHistory, context)
                    //       //  countrycode: currentcountry.countryCode!),
                    //     ));
                    //   },
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         //  color: Color.fromARGB(255, 81, 126, 231),
                    //         margin: EdgeInsets.all(5),
                    //         child: Row(
                    //           children: [
                    //             // Icon( Icons.location_on, color: Colors.white, size: 25),
                    //             Container(
                    //               margin: EdgeInsets.all(5),
                    //               child: Row(
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   CircleAvatar(
                    //                       radius: 40.0, backgroundImage: imageProvider),
                    //                   Container(
                    //                     child: Text(poi.properties?['name']!,
                    //                         textAlign: TextAlign.left,
                    //                         style: TextStyle(
                    //                           color:(poihasbeenvisted)
                    //                               ? Color.fromARGB(255, 49, 52, 59)
                    //                               :Colors.white,
                    //                           fontSize: 20.0,
                    //                           fontWeight: FontWeight.w700,
                    //                         )),
                    //                   ),
                    //                   //    Icon(Icons.star_border, color: Colors.white, size: 25),
                    //                   // (poihasbeenvisted) ? Icon(Icons.star, color: Colors.amber, size: 25) : Icon(Icons.star_border, color: Colors.white, size: 25),
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  );
                }
              },
            ));
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
