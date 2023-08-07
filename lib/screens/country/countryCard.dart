import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/country/ActiveCountryPage.dart';

import '../../model/placehistory.dart';

Widget countrycard(CurrentCountry country, BuildContext context) {
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
              Text(
                CountryFlag(country.countryCode),
                style: TextStyle(fontSize: 25),
              ),
              Container(
              //            color: Color.fromARGB(255, 81, 126, 231),

                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(country.countryName!,
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
        // ButtonBar(
        //   mainAxisSize: MainAxisSize.min,
        //   alignment: MainAxisAlignment.end,
        //   children: [
        //     IconButton(
        //       color: Color.fromARGB(255, 26, 173, 182),
        //       onPressed: () {},
        //       icon: const Icon(Icons.share),
        //       tooltip: 'Share',
        //     ),
        //     //child: Text('SHARE')),
        //     TextButton(
        //         onPressed: () {},
        //         child: Text(
        //             style: TextStyle(color: Color.fromARGB(255, 26, 173, 182)),
        //             'Learn More'))
        //   ],
        // )
      ],
    ),
  );
}
