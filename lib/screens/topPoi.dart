import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/topPoi.dart';
import '../state/applicationstate.dart';
import 'poiList.dart';
import 'dart:developer' as developer;

class topPoiList extends StatefulWidget {
  const topPoiList({super.key});

  @override
  State<topPoiList> createState() => _topPoiListState();
}

class _topPoiListState extends State<topPoiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Top Locations'),
        ),
        body: Consumer<ApplicationState>(
            builder: (context, appState, _) => Container(
                height: 300,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: appState.poiMap.length, //entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final key = appState.poiMap.keys.elementAt(index);
                      final value = appState.poiMap[key];
                      final title = value['title'];
                      final description = value['description'];
                      final TopPoi _toppoi = TopPoi(
                          groupId: key, title: title, description: description);
                      return GestureDetector(
                          child: Container(
                            child: topPoiCard(_toppoi,
                                context), //Text('Entry $key, $title, $description}')),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PoiList(poiToVisit: _toppoi)
                                  // PoiList(TopPoi: topPoi)
                                  ),
                            );
                          });
                    })

                )));
  }
}


Widget topPoiCard(TopPoi topPoi, BuildContext context) {
  return Card(
    color: Color.fromARGB(255, 49, 52, 59),
    elevation: 8.0,
    margin: EdgeInsets.all(5.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
          //  color: Color.fromARGB(255, 81, 126, 231),
          margin: EdgeInsets.all(5),
          child: Row(
            children: [
              (topPoi.title! == 'Top Locations In The World')
                  ? Icon(Icons.location_city, color: Colors.white, size: 25)
                  : Icon(Icons.beach_access, color: Colors.white, size: 25),
              //  Icon(icon: Icons.location_on, color: Colors.white, size: 25),
              //  Text(
              //    CountryFlag(country.countryCode),
              //    style: TextStyle(fontSize: 25),
              //  ),
              Container(
                //            color: Color.fromARGB(255, 81, 126, 231),

                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topPoi.title!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        )),
                    Text(topPoi.description!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )),
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
