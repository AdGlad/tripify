import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String units;
  final String message;
  final double size;

  IconTextWidget({required this.icon, 
                  required this.title, 
                  required this.units, 
                  required this.message, 
                  required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(icon, size: size*3),
          Text(title,style: TextStyle(fontSize: size)),
          SizedBox(width: 8.0), // Add spacing between icon and text
          Text(
            message,
            style: TextStyle(fontSize: size),
          ),
          Text(units,style: TextStyle(fontSize: size)),
    
        ],
      ),
    );
  }
}
