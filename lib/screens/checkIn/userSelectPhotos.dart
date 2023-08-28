import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/placehistory.dart';

CollectionReference<Map<String, dynamic>> imagesCollection =
    FirebaseFirestore.instance.collection('images');
List<String> imagePaths = [];
TextEditingController descriptionController = TextEditingController();
List<XFile>? selectedImages = [];
//List<String>? selectedImagePaths = [];
//XFile? selectedImage;

Future<bool?> showPopupForm(
    BuildContext context,
    WriteBatch batch,
    DocumentReference<Object?> placeHistoryId) async {
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
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Thoughts',
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _selectAndSaveImages(ImageSource.gallery);
                    },
                    child: Text('Image From Gallery'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _selectAndSaveImages(ImageSource.camera);
                    },
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
                developer
                    .log('cancel imagePaths 1 Length ${imagePaths.length} ');
                imagePaths.clear();
                imagePaths = [];
                selectedImages?.clear();

                developer
                    .log('cancel imagePaths 2 Length ${imagePaths.length} ');
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                // await saveImagesToFirestore( batch, placeHistory, placeHistoryId);
                await saveImagesToFirestore(batch, placeHistoryId);
                Navigator.of(context).pop(true);
                // descriptionController.clear();
                // imagePaths.clear();
              },
              child: Text('Save'),
            ),
          ]);
    },
  );
}

Future<void> _selectAndSaveImages(ImageSource _imagesource) async {
  developer.log('imagePaths 1 Length ${imagePaths.length} ');

  imagePaths.clear();
  imagePaths = [];
  selectedImages?.clear();
//  selectedImagePaths?.clear();
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
   // selectedImagePaths?.add(selectedImage.path);
  }
  developer.log('imagePaths 3 Length ${selectedImages?[0]} ');
  developer.log('imagePaths 4 Length $selectedImage ');
  //developer.log('imagePaths 3 Length ${selectedImagePaths?[0]} ');
}

Future<Reference> _saveImageToCloudStorage(XFile imageFile) async {
  String fileName = imageFile.name;
  File? _image = File(imageFile.path);

  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('images/${FirebaseAuth.instance.currentUser!.uid}/$fileName');
  UploadTask uploadTask = storageReference.putFile(_image);

  await uploadTask.whenComplete(() => print('Image uploaded'));

//final storageRef = FirebaseStorage.instance.ref();

  Directory appDirectory = await getApplicationDocumentsDirectory();
  //String fileName = imageFile.path.split('/').last;
  String savedImagePath = '${appDirectory.path}/$fileName';
  File(imageFile.path).copy(savedImagePath);
  return storageReference;
}

// Future<String> _saveImageToDirectory(XFile imageFile) async {
//   String fileName = imageFile.name;
//   File? _image = File(imageFile.path);

//   Reference storageReference = FirebaseStorage.instance
//       .ref()
//       .child('images/${FirebaseAuth.instance.currentUser!.uid}/$fileName');
//   UploadTask uploadTask = storageReference.putFile(_image);

//   await uploadTask.whenComplete(() => print('Image uploaded'));

// //final storageRef = FirebaseStorage.instance.ref();

//   Directory appDirectory = await getApplicationDocumentsDirectory();
//   //String fileName = imageFile.path.split('/').last;
//   String savedImagePath = '${appDirectory.path}/$fileName';
//   File(imageFile.path).copy(savedImagePath);
//   return savedImagePath;
// }

//Future<void> saveImagesToFirestore(    WriteBatch batch, PlaceHistory placeHistory, DocumentReference<Object?> placeHistoryId) async {
Future<void> saveImagesToFirestore(
    WriteBatch batch, DocumentReference<Object?> placeHistoryId) async {
  if (selectedImages != null) {
    for (XFile imageFile in selectedImages!) {
      // String imagePath = await _saveImageToDirectory(imageFile);
      Reference imagePath = await _saveImageToCloudStorage(imageFile);

      imagePaths.add(imagePath.fullPath);
    }
  } else {
    developer.log('selectedImages is null');
  }
  CollectionReference placehistoryref =
      FirebaseFirestore.instance.collection('placehistory');
//final placehistoryRef = PlaceHistoryCollectionReference;
  developer.log('placehistory update before');

  batch.update(placeHistoryId, {
    'rating': '5 Stars',
    // 'poi': 'place of interest',
    'description': descriptionController.text,
    'imagePaths': imagePaths
  });

  // await FirebaseFirestore.instance
  //     .collection('currentuser')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection('country')
  //     .doc(placeHistory.countryCode)
  //     .collection('region')
  //     .doc(placeHistory.regionCode)
  //     .collection('placehistory')
  //     .doc(placeHistoryId)
  //     .update({
  //   'rating': '5 Stars',
  //   'poi': 'place of interest',
  //   'description': descriptionController.text,
  //   'imagePaths': imagePaths
  // });
  developer.log('placehistory update after');
  descriptionController.clear();
  developer.log('save imagePaths 0 Length ${imagePaths.length} ');

  imagePaths.clear();
  imagePaths = [];
  selectedImages?.clear();

  developer.log('save imagePaths 1 Length ${imagePaths.length} ');
}
