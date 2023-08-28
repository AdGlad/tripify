import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import '../model/poi-to-visit.dart';
import 'country/poiCard.dart';

//import 'country/poiCard.dart';

class PoiList extends StatefulWidget {
  PoiToVisit poiToVisit;
  //   String groupId;

  PoiList({required this.poiToVisit});

  @override
  State<PoiList> createState() => _PoiListState();
}

class _PoiListState extends State<PoiList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('Top ' + widget.poiToVisit.description!),
      ),
      body:
    
    FirestoreBuilder<PoiQuerySnapshot>(
        //   return FirestoreBuilder<PoiToVisitQuerySnapshot>(
        ref: poitovisitRef.doc(widget.poiToVisit.groupId).poi,
        // ref: poitovisitRef.doc('DUMMY'),
        builder:
            (context, AsyncSnapshot<PoiQuerySnapshot> snapshot, Widget? child) {
          //   builder: (context, AsyncSnapshot<PoiToVisitQuerySnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading poi-to-visit...');

          // Access the QuerySnapshot
          PoiQuerySnapshot querySnapshot = snapshot.requireData;
          //        PoiToVisitQuerySnapshot querySnapshot = snapshot.requireData;

          //  PoiToVisit querySnapshot = snapshot.requireData;

          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              //                PoiToVisit poiToVisit = querySnapshot.docs[index].data;

              Poi poi = querySnapshot.docs[index].data;

              return GestureDetector(
                  // child: Text("poi.properties!")
                  child: PoitCard(poi, context) //Text(poi.properties?['name'])
                  //    child: Text(poiToVisit.description!)

                  //   child: PoiCard(poi, context)
                  // ,onTap: () {
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //                 builder: (context) => PoiMapPage(
                  //       //                 poi: poi.groupId)
                  //       //           ),
                  //       // );
                  // }
                  );
            },
          );
        }
    ));
    
  }

}
