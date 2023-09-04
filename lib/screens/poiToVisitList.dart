import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/poiList.dart';
import 'package:provider/provider.dart';

import '../model/poi-to-visit.dart';
import '../state/applicationstate.dart';
import 'country/poiToVisitCard.dart';

 class PoiToVisitList extends StatefulWidget {
     const PoiToVisitList({super.key});

   @override
   State<PoiToVisitList> createState() => _PoiToVisitListState();
 }

class _PoiToVisitListState extends State<PoiToVisitList> {
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      appBar: AppBar(
        title: const Text('Top Locations'),
      ),
      body:
    FirestoreBuilder<PoiToVisitQuerySnapshot>(
      ref: poitovisitRef,
      builder: (context, AsyncSnapshot<PoiToVisitQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading poi-to-visit...');

        // Access the QuerySnapshot
        PoiToVisitQuerySnapshot querySnapshot = snapshot.requireData;

        return 
        Container(
          child: Consumer<ApplicationState>(
              builder: (context, appState, _) => 
        ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            // Access the User instance
            PoiToVisit poiToVisit = querySnapshot.docs[index].data;

            return GestureDetector(child: PoiToVisitCard(poiToVisit, context)
            ,onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                                  builder: (context) => PoiList(
                                  poiToVisit: poiToVisit,
                                  )
                            ),
                  );
            }
                  );
          },
        )
          ));
          
      }
    ));
  }
}