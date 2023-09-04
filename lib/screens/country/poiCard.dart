import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/poi-to-visit.dart';
import 'package:gtk_flutter/screens/country/ActiveCountryPage.dart';

import '../../model/placehistory.dart';

Widget PoitCard(Poi poi, BuildContext context) {
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
              Icon( Icons.location_on, color: Colors.white, size: 25),
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
                    Text(poi.properties?['name']!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )),
                        Icon(Icons.star_border, color: Colors.white, size: 25), 
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
