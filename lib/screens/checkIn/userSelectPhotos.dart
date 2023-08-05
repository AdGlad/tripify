import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:developer' as developer;
import 'package:path_provider/path_provider.dart';

import '../../model/placehistory.dart';
import '../country/ActiveCountryPage.dart';

CollectionReference<Map<String, dynamic>> imagesCollection =
    FirebaseFirestore.instance.collection('images');
List<String> imagePaths = [];
TextEditingController descriptionController = TextEditingController();
List<XFile>? selectedImages;

 Future<bool?> showPopupForm(BuildContext context, PlaceHistory placeHistory,
     String placeHistoryId) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Trip Details'),
          content: 
         // Text('Do you want to save the form?'),
           Column(
             mainAxisSize: MainAxisSize.min,
             children: [
             // Text(style: TextStyle(fontSize: 12), placeHistoryId),
            //  Text(style: TextStyle(fontSize: 12), placeHistory.streetAddress!),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Thoughts',
                ),
              ),
              ElevatedButton(
                onPressed: _selectAndSaveImages,
                child: Text('Select Images'),
              ),
             ],
          ),

          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                 Navigator.of(context).pop(false);
                descriptionController.clear();
                imagePaths.clear();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                 _saveImagesToFirestore(placeHistory, placeHistoryId);
                Navigator.of(context).pop(true);
              },
              child: Text('Save'),
            ),
          ]
        );
      },
    );
  }


void _selectAndSaveImages() async {
  selectedImages = await ImagePicker().pickMultiImage();
  }
Future<String> _saveImageToDirectory(XFile imageFile) async {
  Directory appDirectory = await getApplicationDocumentsDirectory();
  String fileName = imageFile.path.split('/').last;
  String savedImagePath = '${appDirectory.path}/$fileName';
  File(imageFile.path).copy(savedImagePath);
  return savedImagePath;
}

Future<void> _saveImagesToFirestore(
    PlaceHistory placeHistory, String placeHistoryId) async {
        if (selectedImages != null) {
    for (XFile imageFile in selectedImages!) {
            String imagePath = await _saveImageToDirectory(imageFile);
      imagePaths.add(imagePath);
    }
  }
  CollectionReference placehistoryref =
      FirebaseFirestore.instance.collection('placehistory');
//final placehistoryRef = PlaceHistoryCollectionReference;
  developer.log('placehistory update before');

  await FirebaseFirestore.instance
      .collection('currentuser')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('country')
      .doc(placeHistory.countryCode)
      .collection('region')
      .doc(placeHistory.regionCode)
      .collection('placehistory')
      .doc(placeHistoryId)
      .update({
    'rating': '5 Stars',
    'poi': 'place of interest',
    'description': descriptionController.text,
    'imagePaths': imagePaths
  });
  developer.log('placehistory update after');
                  descriptionController.clear();
                imagePaths.clear();

}
