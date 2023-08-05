      
      import 'package:flutter/material.dart';

Widget leagueTitleContainer() {

       return Container(
          //             color: Color.fromARGB(255, 49, 52, 59),
          //  elevation: 8.0,
          margin: EdgeInsets.all(5.0),
          //  shape: RoundedRectangleBorder(
          //      borderRadius: BorderRadius.circular(15)),
          child: Card(
            // width:
            color: Color.fromARGB(255, 49, 52, 59),
            elevation: 8.0,
            margin: EdgeInsets.all(5.0),
         //  shape:
         //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("League: Distance Travelled ",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                  textAlign: TextAlign.center),
            ),
          ),
          // color: Colors.white,
        );
      }
