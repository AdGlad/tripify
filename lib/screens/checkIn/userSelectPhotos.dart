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
//import 'package:firebase_storage/firebase_storage.dart';

import '../../model/placehistory.dart';
import '../country/ActiveCountryPage.dart';

CollectionReference<Map<String, dynamic>> imagesCollection =
    FirebaseFirestore.instance.collection('images');
List<String> imagePaths = [];
TextEditingController descriptionController = TextEditingController();
List<XFile>? selectedImages = [];
List<String>? selectedImagePaths =[];
//XFile? selectedImage;

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
              Column(
                children: [
                  ElevatedButton(
                    onPressed:  () async { await _selectAndSaveImages(ImageSource.gallery);},
                    child: Text('Image From Gallery'),
                  ),
                                    ElevatedButton(
                    onPressed: () async {await _selectAndSaveImages(ImageSource.camera);},
                    child: Text('Image From Camera'),
                  ),
                ],
              ),
             ],
          ),

          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                 Navigator.of(context).pop(false);
                descriptionController.clear();
                developer.log('cancel imagePaths 1 Length ${imagePaths.length} ');
                imagePaths.clear();
                imagePaths = [];
                selectedImages?.clear();

                developer.log('cancel imagePaths 2 Length ${imagePaths.length} ');

              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                 _saveImagesToFirestore(placeHistory, placeHistoryId);
                Navigator.of(context).pop(true);
               // descriptionController.clear();
               // imagePaths.clear();
              },
              child: Text('Save'),
            ),
          ]
        );
      },
    );
  }


Future <void> _selectAndSaveImages(ImageSource _imagesource ) async {
   developer.log('imagePaths 1 Length ${imagePaths.length} ');

  imagePaths.clear();
  imagePaths = [];
  selectedImages?.clear();
  selectedImagePaths?.clear();
  //selectedImage = null;


 developer.log('imagePaths 2 Length ${imagePaths.length} ');

 // selectedImages = await ImagePicker().pickMultiImage( );
 // XFile? selectedImage = await ImagePicker().pickImage(requestFullMetadata: true,
 //   maxHeight: 300,maxWidth: 300, preferredCameraDevice: CameraDevice.rear,
 //   source: ImageSource.camera);
  //XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  XFile? selectedImage = await ImagePicker().pickImage(source: _imagesource);
  if (selectedImage != null) {
      developer.log('selectedImage is not null ');

  selectedImages?.add(selectedImage);
  selectedImagePaths?.add(selectedImage.path);
  }
  developer.log('imagePaths 3 Length ${selectedImages?[0]} ');
  developer.log('imagePaths 4 Length $selectedImage ');
  developer.log('imagePaths 3 Length ${selectedImagePaths?[0]} ');

  }
Future<String> _saveImageToDirectory(XFile imageFile) async {
final storageRef = FirebaseStorage.instance.ref();

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
  } else
  {
      developer.log('selectedImages is null');

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
  developer.log('save imagePaths 0 Length ${imagePaths.length} ');

  imagePaths.clear();
  imagePaths = [];
  selectedImages?.clear();

  developer.log('save imagePaths 1 Length ${imagePaths.length} ');

}
