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

Future showPopupForm(BuildContext context, PlaceHistory placeHistory,
    String placeHistoryId) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          
          title: Text('Trip Details'),
          content: Column(
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
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                descriptionController.clear();
                imagePaths.clear();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _saveImagesToFirestore(placeHistory, placeHistoryId);
                Navigator.pop(context);
                descriptionController.clear();
                imagePaths.clear();
              },
              child: Text('Save'),
            ),
                      //             ElevatedButton(
                      //   child: Text('Share', style: TextStyle(fontSize: 12)),
                      //   onPressed: () {
                      //     String flags = '';
                      // //    for (var item in appState.tripHistory) {
                      // //      flags = flags + CountryFlag(item.countryCode!);
                      // //    }
                      //     FlutterShare.share(
                      //       //  title: 'My Streak',
                      //       title: 'My Location',
                      //       text:
                      //           //  'Tripify: I have a $_currentStreak day streak! \n Travelled ${appState.user.DistanceTotal} Kms\n visited ${appState.user.countrycount} countries \n $flags',
                      //           // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.user.distancetotal} Kms\n visited ${appState.user.countrycount} countries \n $flags',
                      //           // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.user.distancetotal} Kms\n visited ${appState.user.countrycount} countries \n $flags',
                      //           'Tripify: Hi, I am visiting ${placeHistory.region} in ${placeHistory.countryName} ${CountryFlag(placeHistory.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                      //       chooserTitle: 'Share on social media',
                      //     );
                      //     // TODO: Implement share functionality
                      //     Navigator.of(context).pop();
                      //   },
                      // ),
          ],
        ),
      );
    },
  );
}

void _selectAndSaveImages() async {
  List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
  if (selectedImages != null) {
    for (XFile imageFile in selectedImages) {
            String imagePath = await _saveImageToDirectory(imageFile);
      imagePaths.add(imagePath);
     // String imagePath = imageFile.path;
     // String fileName = imagePath.split('/').last;
     // final File savedImage = await imageFile.saveTo('tripify/$fileName');

     // imagePaths.add(savedImage.path);
    }
  }
}
Future<String> _saveImageToDirectory(XFile imageFile) async {
  Directory appDirectory = await getApplicationDocumentsDirectory();
  String fileName = imageFile.path.split('/').last;
  String savedImagePath = '${appDirectory.path}/$fileName';
  File(imageFile.path).copy(savedImagePath);
  return savedImagePath;
}

void _saveImagesToFirestore(
    PlaceHistory placeHistory, String placeHistoryId) async {
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

  // placehistoryref.  doc(placeHistoryId) ({
  // 'description': descriptionController.text,
  // 'imagePaths': imagePaths
  // });

  // imagesCollection.add({
  //   'description': descriptionController.text,
  //   'imagePaths': imagePaths,
  // });
}
