import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:gtk_flutter/screens/UserInfo/profilepage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;
import 'package:image/image.dart' as img;

class CropPage extends StatefulWidget {
  final String title;
  final String currentAvatar;
  final Function(String) updateAvatar; // Callback function to update avatar

  CropPage(
      {required this.title,
      required this.currentAvatar,
      required this.updateAvatar});

//  const CropPage({
//    Key? key,
//    required this.title,
//  }) : super(key: key);

  @override
  _CropPageState createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  XFile? _pickedFile;
  //File? _image;
  CroppedFile? _croppedFile;
  CroppedFile? croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (kIsWeb)
            Padding(
              padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Theme.of(context).highlightColor),
              ),
            ),
          Expanded(child: _body()),
          // FloatingActionButton(
          //   onPressed: () {
          //     widget.updateAvatar("images/0qlNcVgclFZNSASXXPbX44ae1vo2/image_picker_0232C876-A8A5-4B2A-A13E-E486D7445A6A-33844-00001117E82F4518.jpg");
          //   },
          //   backgroundColor: Colors.redAccent,
          //   tooltip: 'Delete',
          //   child: const Icon(Icons.delete),
          // ),
        ],
      ),
    );
  }

  Widget _body() {
    //   return _imageCard();

    if (_croppedFile != null || _pickedFile != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kIsWeb ? 24.0 : 16.0),
            child: Card(
              shape: CircleBorder(),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),

                // child: AvatarImage(storagePath: widget.currentAvatar)
                //Image.file(File(widget.currentAvatar))
                //    child: _croppedFile?.path != null ? Image.file(File(_croppedFile!.path)) : Image.file(File(widget.currentAvatar)),

                child: _croppedFile?.path != null
                    ? Image.file(File(_croppedFile!.path))
                    : Image.file(File(_pickedFile!.path)),
              ),
            ),
          ),
          const SizedBox(height: 60.0),
          _menu(),
        ],
      ),
    );
  }

  // Widget _image() {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   if (_croppedFile != null) {
  //     final path = _croppedFile!.path;
  //     return ConstrainedBox(
  //       constraints: BoxConstraints(
  //         maxWidth: 0.8 * screenWidth,
  //         maxHeight: 0.7 * screenHeight,
  //       ),
  //       child: kIsWeb ? Image.network(path) : Image.file(File(path)),
  //     );
  //   } else if (_pickedFile != null) {
  //     final path = _pickedFile!.path;
  //     return ConstrainedBox(
  //       constraints: BoxConstraints(
  //         maxWidth: 0.8 * screenWidth,
  //         maxHeight: 0.7 * screenHeight,
  //       ),
  //       child: kIsWeb ? Image.network(path) : Image.file(File(path)),
  //     );
  //   } else {
  //     return const SizedBox.shrink();
  //   }
  // }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'crop1',
          onPressed: () {
            _clear();
          },
          backgroundColor: Colors.redAccent,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (_croppedFile != null)
          FloatingActionButton(
            heroTag: 'crop2',
            onPressed: () async {
              widget.updateAvatar(_croppedFile!.path);
              //     _saveUserAvatar(_croppedFile!.path);

              // saveImagePathToCloudStorage(_croppedFile!.path);
              Navigator.pop(context);
            },
            backgroundColor: Colors.redAccent,
            tooltip: 'Set as avatar',
            child: const Icon(Icons.check_circle),
          ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              heroTag: 'crop3',
              onPressed: () {
                _cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Column(
     //   alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              //  fit: BoxFit.cover, //
              child: AvatarImage(
                  storagePath:
                      widget.currentAvatar)), // Replace with your image URL

          ElevatedButton(
            onPressed: () async {
              await _uploadImage();
              await _cropImage();
              // Handle button click here
            },
            child: Text('Upload'),
          ),
        ],
      ),
    );
  }

  //   Center(
  //     child: Card(
  //       elevation: 4.0,
  //       shape: CircleBorder(),

  //       //  RoundedRectangleBorder(
  //       //   borderRadius: BorderRadius.circular(16.0),
  //       // ),
  //       child:
  //       SizedBox(
  //         width: kIsWeb ? 380.0 : 320.0,
  //         height: 300.0,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             AvatarImage(storagePath: widget.currentAvatar),

  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 24.0),
  //               child: ElevatedButton(
  //                 onPressed: () async {
  //                   await _uploadImage();
  //                   await _cropImage();
  //                 },
  //                 child: const Text('Upload'),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _uploaderCard() {
  //   return Center(
  //     child: Card(
  //       elevation: 4.0,
  //       shape: CircleBorder(),

  //       //  RoundedRectangleBorder(
  //       //   borderRadius: BorderRadius.circular(16.0),
  //       // ),
  //       child:
  //       SizedBox(
  //         width: kIsWeb ? 380.0 : 320.0,
  //         height: 300.0,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Expanded(child: AvatarImage(storagePath: widget.currentAvatar)),
  //             // Expanded(
  //             //   child: Padding(
  //             //     padding: const EdgeInsets.symmetric(
  //             //         horizontal: kIsWeb ? 24.0 : 16.0),
  //             //     child: Card(
  //             //       shape: CircleBorder(),
  //             //       elevation: 4.0,
  //             //       child: Padding(
  //             //         padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),

  //             //         child:
  //             //             //   _croppedFile?.path != null ? Image.file(File(_croppedFile!.path)) :
  //             //             AvatarImage(storagePath: widget.currentAvatar),
  //             //         //Image.file(File(widget.currentAvatar)),

  //             //         //    child: _croppedFile?.path != null ? Image.file(File(_croppedFile!.path)) : Image.file(File(_pickedFile!.path)),
  //             //       ),
  //             //     ),
  //             //   ),

  //               // Padding(
  //               //   padding: const EdgeInsets.all(16.0),
  //               //   child: DottedBorder(
  //               //     radius: const Radius.circular(12.0),
  //               //     borderType: BorderType.Circle,
  //               //   //  borderType: BorderType.RRect,
  //               //     dashPattern: const [8, 4],
  //               //     color: Theme.of(context).highlightColor.withOpacity(0.4),
  //               //     child: Center(
  //               //       child: Column(
  //               //         mainAxisSize: MainAxisSize.min,
  //               //         crossAxisAlignment: CrossAxisAlignment.center,
  //               //         children: [
  //               //           Icon(
  //               //             Icons.image,
  //               //             color: Theme.of(context).highlightColor,
  //               //             size: 80.0,
  //               //           ),
  //               //           const SizedBox(height: 24.0),
  //               //           Text(
  //               //             'Upload an image to start',
  //               //             style: kIsWeb
  //               //                 ? Theme.of(context)
  //               //                     .textTheme
  //               //                     .headlineSmall!
  //               //                     .copyWith(
  //               //                         color: Theme.of(context).highlightColor)
  //               //                 : Theme.of(context)
  //               //                     .textTheme
  //               //                     .bodyMedium!
  //               //                     .copyWith(
  //               //                         color:
  //               //                             Theme.of(context).highlightColor),
  //               //           )
  //               //         ],
  //               //       ),
  //               //     ),
  //               //   ),
  //               // ),
  //            // ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 24.0),
  //               child: ElevatedButton(
  //                 onPressed: () async {
  //                   await _uploadImage();
  //                   await _cropImage();
  //                 },
  //                 child: const Text('Upload'),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      croppedFile = await ImageCropper().cropImage(
        maxHeight: 200,
        maxWidth: 200,
        sourcePath: _pickedFile!.path,
        //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1), // To maintain a square aspect ratio
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        cropStyle: CropStyle.circle,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            //  viewPort:
            //      const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );

      if (croppedFile != null) {
        final img.Image image =
            img.decodeImage(File(croppedFile!.path).readAsBytesSync())!;
        final int centerX = (image.width / 2).toInt();
        final int centerY = (image.height / 2).toInt();
        final int radius = centerX < centerY
            ? centerX
            : centerY; // Minimum of half width or half height
        final img.Image circleImage = img.copyCropCircle(image,
            radius: radius, center: img.Point(centerX, centerY));

        final List<int> circularImageBytes = img.encodePng(circleImage);
        final circularImageFile = File('${croppedFile!.path}');
        await circularImageFile.writeAsBytes(circularImageBytes);

        developer.log("croppedFile.path: ${croppedFile!.path}");
        setState(() {
          _croppedFile = CroppedFile(circularImageFile.path);
          // _croppedFile = croppedFile;
        });
      } else {
        developer.log("croppedFile is null");
      }
    }
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }

  Future<void> _saveUserAvatar(String avatarPath) async {
    // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //     .collection('users')
    //     .where(FieldPath.documentId,
    //         isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
    //     .get();

    final user = FirebaseAuth.instance.currentUser;
    // await user?.updateDisplayName(_nicknameController.text);
    // await user!.updateDisplayName("you");
    //developer.log('Update Displayname ${_nicknameController.text}');
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      // set({
      // 'userId': FirebaseAuth.instance.currentUser!.uid,
      'avatar': avatarPath,
      //   'email': _email,
      // 'age': int.parse(_ageController.text),
      //   'friend': _friendable,
      //   'league': _league,
    });
  }
}
