import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../model/topPoi.dart';
import '../state/applicationstate.dart';
import 'poiList.dart';
//import 'poiList.dart';
 class TopPoiList extends StatefulWidget {
     const TopPoiList({super.key});

   @override
   State<TopPoiList> createState() => _TopPoiListState();
 }

class _TopPoiListState extends State<TopPoiList> {
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      appBar: AppBar(
        title: const Text('Top Locations'),
      ),
      body:
    FirestoreBuilder<TopPoiQuerySnapshot>(
      ref: toppoiRef,
      builder: (context, AsyncSnapshot<TopPoiQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading poi-to-visit...');

        // Access the QuerySnapshot
        TopPoiQuerySnapshot querySnapshot = snapshot.requireData;

        return 
        Container(
          child: Consumer<ApplicationState>(
              builder: (context, appState, _) => 
        ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            // Access the User instance
            TopPoi topPoi = querySnapshot.docs[index].data;

            return GestureDetector(child: topPoiCard(topPoi, context)
            ,onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                                  builder: (context) => 
                                  PoiList(poiToVisit: topPoi)
                                  // PoiList(TopPoi: topPoi)
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
              (topPoi.title! =='Top Locations In The World') ?
              Icon(  Icons.location_city, color: Colors.white, size: 25)
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
