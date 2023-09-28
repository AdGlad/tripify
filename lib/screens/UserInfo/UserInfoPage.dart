import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
//import 'dart:js_interop';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
import 'package:gtk_flutter/screens/UserInfo/cropImage.dart';
//import 'package:gtk_flutter/screens/UserInfo/crop.dart';
import 'package:gtk_flutter/screens/UserInfo/profileimagelogic.dart';
import 'package:gtk_flutter/screens/UserInfo/profilepage.dart';
import 'package:gtk_flutter/screens/findfriendpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
//import 'package:toggle_switch/toggle_switch.dart';
import '../../src/acceptfriendrequests.dart';
import '../../src/firebaseImage.dart';
import '../topPoi.dart';
import 'listfriends.dart';
import '../../state/applicationstate.dart';
import 'dart:developer' as developer;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'package:path/path.dart' as path;

String? _avatar;
File? _avatarFile;
//import 'package:firebase_storage/firebase_storage.dart';
Widget buildCard(
    int? amount, String unitofmeasure, IconData icon, String description) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(icon, size: 40.0),
          SizedBox(height: 8.0),
          Text(description),
          Text('$amount $unitofmeasure'),
        ],
      ),
    ),
  );
}

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  //final _ageController = TextEditingController();
  //int _friendable = 0;
  // int _league = 0;
  String _errorMessage = '';
  //String? _email;
  String? _avatar;
  

  @override
  void initState() {
    //  File? _avatarFile = await getImageFile(applicationState.userProfile!.avatar!);

    super.initState();
    // getUserInfo();
    // _nicknameController.text = "Adam";
//    final applicationState =
//        Provider.of<ApplicationState>(context, listen: true);
//
    //  _nicknameController.text = applicationState.userProfile!.nickname!;
  }

  // Future<void> getUserInfo() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   _email = user?.email;

  //   final userData = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get();

  //   if (userData.exists) {
  //     setState(() {
  //       if (userData.data()!.containsKey('nickname')) {
  //         _nicknameController.text = userData['nickname'] ?? user.displayName;
  //       }
  //       if (userData.data()!.containsKey('email')) {
  //         _email = userData['email'];
  //       } else {
  //         _email = user.email;
  //       }

  //       if (userData.data()!.containsKey('friend')) {
  //         _friendable = userData['friend'];
  //       } else {
  //         _friendable = 1;
  //       }

  //       if (userData.data()!.containsKey('league')) {
  //         _league = userData['league'];
  //       } else {
  //         _league = 1;
  //       }

  //       if (userData.data()!.containsKey('avatar')) {
  //         _avatar = userData['avatar'];
  //       } else {
  //         _avatar = "";
  //       }

  //       //  _ageController.text = userData['age'].toString();
  //       // _friendable = userData['friend'] ?? 1;
  //       // _league = userData['league'] ?? 1;
  //     });
  //   }
  // }

  Future<void> _saveUserInfo() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('nickname', isEqualTo: _nicknameController.text.toLowerCase())
        .where(FieldPath.documentId,
            isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // 'Nickname is already taken. Please choose a different nickname.';
      setState(() {
        _errorMessage = 'Nickname is not unique.';
      });
      return;
    } else {
      setState(() {
        _errorMessage = '';
      });
      final user = FirebaseAuth.instance.currentUser;
      // await user?.updateDisplayName(_nicknameController.text);
      // await user!.updateDisplayName("you");
      //developer.log('Update Displayname ${_nicknameController.text}');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        // set({
        // 'userId': FirebaseAuth.instance.currentUser!.uid,
        'nickname': _nicknameController.text.toLowerCase(),
     //   'avatar': _avatar,
        //   'email': _email,
        // 'age': int.parse(_ageController.text),
        //   'friend': _friendable,
        //   'league': _league,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _nicknameController.text = "Adam";
    final applicationState =
        Provider.of<ApplicationState>(context, listen: true);
    _nicknameController.text =
        applicationState.userProfile!.nickname!.toLowerCase();

    return Container(
      child: Consumer<ApplicationState>(
        builder: (context, appState, _) => Center(
          child: Scaffold(
            // appBar: AppBar(
            //   title: Text('User Info'),
            // ),
            body: Form(
              key: _formKey,
              child: ListView(
                //     padding: EdgeInsets.all(5),
                children: [
                  // Center(
                  //   child: GestureDetector(
                  //       onTap: () async {
                  //         // Add your onTap logic here
                  //         print('CircleAvatar tapped!');

                  //         XFile? avatarXFile =
                  //             await pickImageFromSource(ImageSource.gallery);
                  //         //     String? _avatar = await writeimage(avatarXFile);
                  //         //   XFile? avatarclipedXFile =  await saveClippedImage(avatarXFile!);
                  //         Reference imagePath =
                  //             await saveImageToCloudStorage(avatarXFile!);
                  //         _avatar = imagePath.fullPath;
                  //         _avatarFile = await getImageFile(_avatar!);
                  //         developer.log(' imageFile is not null $_avatar ');
                  //         _saveUserInfo();
                  //       },
                  //       child: AvatarImage(
                  //           storagePath:
                  //               applicationState.userProfile!.avatar!)),
                  // ),

                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nicknameController,
                    decoration: InputDecoration(
                        labelText: 'Enter Nickname in lower case'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a nickname  in lower case';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  //  SizedBox(height: 16),
                  // TextFormField(
                  //   controller: _ageController,
                  //   decoration: InputDecoration(labelText: 'Age'),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter an age';
                  //     }
                  //     final age = int.tryParse(value!);
                  //     if (age == null || age <= 0) {
                  //       return 'Please enter a valid age';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // SizedBox(height: 16),
                  // Text("Email: $_email"),
                  //SizedBox(height: 16),
                  //Text("Appear in the league tables?"),

                  // ToggleSwitch(
                  //   initialLabelIndex: _friendable,
                  //   totalSwitches: 2,
                  //   labels: ['Yes', 'No'],
                  //   onToggle: (index) {
                  //     setState(() {
                  //       _friendable = index!;
                  //       // if (index == 0) {
                  //       //   _Friendable = true;
                  //       // } else {
                  //       //   _Friendable = false;
                  //       // }
                  //     });
                  //   },
                  // ),
                  // SizedBox(height: 16),
                  // Text("Allow others to friend you?"),
                  // ToggleSwitch(
                  //   initialLabelIndex: _league,
                  //   totalSwitches: 2,
                  //   labels: ['Yes', 'No'],
                  //   onToggle: (index) {
                  //     setState(() {
                  //       _league = index!;

                  //       // if (index == 0) {
                  //       //   _League = 0;
                  //       // } else {
                  //       //   _League = 1;
                  //       // }
                  //     });
                  //   },
                  // ),
                  //)
                  // CheckboxListTile(
                  //   title: Text(
                  //       'Tick if you would like others to be able to friend you'),
                  //   value: _Friendable,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _Friendable = value!;
                  //     });
                  //   },
                  // ),
                  // CheckboxListTile(
                  //   title: Text(
                  //       'Public Profile. Tick if you would like your stats to appear in the league tables'),
                  //   value: _League,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _League = value!;
                  //     });
                  //   },
                  // ),
                  //SizedBox(height: 16),

                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(200, 48)), // Set the desired width and height
                      ),
                      // style: ButtonStyle.lerp(a, b, t),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveUserInfo();
                          //     Navigator.pop(context);
                        }
                      },
                      child: Text('Save'),
                    ),
                  ),
                  // Expanded(
                  //                 child: buildCard(
                  //                   appState.userProfile!.countrycount,
                  //                    // userProfile?['countrycount'],
                  //                     '',
                  //                     Icons.map_outlined,
                  //                     'Countries')),
                  SizedBox(height: 16.0),


// Expanded(
//                 child: Crop(
//                   key: cropKey,
//                   image: FileImage(_avatarFile!),
//                   aspectRatio: 1.0, // To crop it as a circle
//                   maximumScale: 2.0, // Adjust maximum scale as needed
//                 ),
//               ),
              
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(200, 48)), // Set the desired width and height
                      ),
                      // style: ButtonStyle.lerp(a, b, t),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                           // builder: (context) => CropPage( title: 'Crop Page',),
                          //  builder: (context) => CropImageScreen(),
                            builder: (context) => ProfilePage1( appState.userProfile!),
                         //   builder: (context) => CropSample(),
                          ),
                        );
                      },
                      child: Text('User Profile'),
                    ),
                  ),
                  Center(
                      child: Consumer<ApplicationState>(
                          builder: (context, appState, _) => Container(
                              child: userStatsContainer(
                                  appState.userProfile, context)))),

                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(200, 48)), // Set the desired width and height
                      ),
                      // style: ButtonStyle.lerp(a, b, t),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindFriendsPage(),
                          ),
                        );

                        //   Navigator.of(context)
                        //       .pushReplacementNamed('/findfriends');
                        // Navigator.of(context).pushReplacementNamed('/findfriends');
                        //   Navigator.pushNamed(context, 'findfriends');
                        //  Navigator.push(context, '/findfriends');
                      },
                      child: Text('Find Friends'),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(200, 48)), // Set the desired width and height
                      ),
                      // style: ButtonStyle.lerp(a, b, t),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptFriendRequests(),
                          ),
                        );

                        //   Navigator.of(context)
                        //       .pushReplacementNamed('/findfriends');
                        // Navigator.of(context).pushReplacementNamed('/findfriends');
                        //   Navigator.pushNamed(context, 'findfriends');
                        //  Navigator.push(context, '/findfriends');
                      },
                      child: Text('Accept Requests'),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(200, 48)), // Set the desired width and height
                      ),
                      // style: ButtonStyle.lerp(a, b, t),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListFriends(),
                          ),
                        );

                        //   Navigator.of(context)
                        //       .pushReplacementNamed('/findfriends');
                        // Navigator.of(context).pushReplacementNamed('/findfriends');
                        //   Navigator.pushNamed(context, 'findfriends');
                        //  Navigator.push(context, '/findfriends');
                      },
                      child: Text('Friends'),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(200, 48)), // Set the desired width and height
                      ),
                      // style: ButtonStyle.lerp(a, b, t),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => topPoiList(),
                          ),
                        );

                        //   Navigator.of(context)
                        //       .pushReplacementNamed('/findfriends');
                        // Navigator.of(context).pushReplacementNamed('/findfriends');
                        //   Navigator.pushNamed(context, 'findfriends');
                        //  Navigator.push(context, '/findfriends');
                      },
                      child: Text('Top Locations'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// }

// Future<XFile?> pickImageFromSource(ImageSource _imagesource) async {
//   XFile? selectedImage = await ImagePicker().pickImage(source: _imagesource);
//   if (selectedImage != null) {
//     developer.log('selectedImage is not null ');

//     return selectedImage;
//   }
//   // developer.log('imagePaths 3 Length ${selectedImages?[0]} ');
//   // developer.log('imagePaths 4 Length $selectedImage ');
// }

// Future<String?> saveClippedImage(XFile sourceImage) async {
//   final image = img.decodeImage(File(sourceImage.path).readAsBytesSync());

//   // Create a circular mask
//   final mask = img.Image(image!.width, image.height);
//   img.fill(mask, img.getColor(255, 255, 255, 0)); // Transparent

//   // Draw the clipped image
//   img.drawCircle(mask, image.width ~/ 2, image.height ~/ 2,
//       (image.width / 2).round(), img.getColor(255, 255, 255, 255));

//   // Resize the clipped image to a square
//   //final clippedImage = img.copyCrop(mask, 0, 0, image.width, image.height);

//   // Get the directory for saving the clipped image
//   final appDir = await getApplicationDocumentsDirectory();
//   final clippedImagePath = '${appDir.path}/clipped_image.jpg';

//   // Save the clipped image to the file system
//   //File(clippedImagePath).writeAsBytesSync(img.encodeJpg(clippedImage));

//   return clippedImagePath;
// }


Future<Reference> saveImagePathToCloudStorage(String imagePath) async {
  //String fileName = 'avatar_${FirebaseAuth.instance.currentUser!.uid}.jpg'; //' path.basename(imagePath);
  String fileName = 'avatar/avatar_' + imagePath.split('/').last;

  File? _image = File(imagePath);

Reference storageReferenceCompressed = FirebaseStorage.instance.ref().child(
     'images/${FirebaseAuth.instance.currentUser!.uid}/$fileName');
  
  final compressedImageData = await compressImage(imagePath, quality: 80);
  final metadata = SettableMetadata(contentType: 'image/jpeg');
  UploadTask uploadTaskCompressed =
      storageReferenceCompressed.putData(compressedImageData!, metadata);
await uploadTaskCompressed
      .whenComplete(() => print('Image Compressed uploaded'));
  Directory appDirectory = await getApplicationDocumentsDirectory();
  //String fileName = _clippedImage.path.split('/').last;
  String savedImagePath = '${appDirectory.path}/$fileName';
  File(imagePath).copy(savedImagePath);

  return storageReferenceCompressed;
}



File uint8ListToFile(Uint8List uint8list, String filePath) {
  final file = File(filePath);
  file.writeAsBytesSync(uint8list);
  return file;
}


Future<Reference> saveImageToCloudStorage(XFile imageFile,String filetype) async {
  String fileName = imageFile!.name;
  File? _image = File(imageFile.path);
  Reference storageReference;
  UploadTask uploadTask;
  File _imageToSave;
  String imageDirectory ='';


 if (filetype=='Thumbnail')
 {
    imageDirectory = '/thumbnail';
    _imageToSave = await createThumbnail(_image, 80, 80);

}else if (filetype=='Compress')
{
    imageDirectory = '/compress';

       final  _imageCompress = await  compressImage(imageFile.path);
       _imageToSave = uint8ListToFile(_imageCompress!,imageFile.path);
} else if (filetype=='CropCircle')
{
      imageDirectory = '/cropcircle';
     _imageToSave = await createCropCircle(_image,80);

} else {
  imageDirectory = '/original';
  _imageToSave = _image;
}

  storageReference = FirebaseStorage.instance.ref().child(
      'images/${FirebaseAuth.instance.currentUser!.uid}' + imageDirectory + '/$fileName');
       uploadTask =      storageReference.putFile(_imageToSave);
      await uploadTask.whenComplete(() => print('Image $filetype uploaded'));

   return storageReference;
}




// Future<Reference> saveImageToCloudStorage(XFile imageFile,String filetype) async {
//   String fileName = imageFile!.name;
//   File? _image = File(imageFile.path);


// //  Reference storageReference = FirebaseStorage.instance.ref().child(
// //      'images/${FirebaseAuth.instance.currentUser!.uid}/compressed/$fileName');

//   //Reference storageReferenceCompressed = FirebaseStorage.instance.ref().child(
//   //    'images/${FirebaseAuth.instance.currentUser!.uid}/compressed/$fileName');

//   Reference storageReferenceThumbnail = FirebaseStorage.instance.ref().child(
//       'images/${FirebaseAuth.instance.currentUser!.uid}/thumbnail/$fileName');

//   Reference storageReferenceClipped = FirebaseStorage.instance.ref().child(
//       'images/${FirebaseAuth.instance.currentUser!.uid}/clipped/$fileName');
  

//   File? _imageThumbnail = await createThumbnail(_image, 80, 80);
//   //final compressedImageData = await compressImage(imageFile.path);
//   //final metadata = SettableMetadata(contentType: 'image/jpeg');
//   File? _imageClipped = await createCropCircle(_image,80);

//   //UploadTask uploadTaskOrig = storageReference.putFile(_image);
//   UploadTask uploadTaskClipped = storageReferenceClipped.putFile(_imageClipped);
//   UploadTask uploadTaskThumbnail =
//       storageReferenceThumbnail.putFile(_imageThumbnail);
//   //UploadTask uploadTaskCompressed =
//   //    storageReference.putData(compressedImageData!, metadata);



//   //UploadTask uploadTaskThumbnail = storageReferencethumbnail.putFile(_image);

//   //await uploadTaskOrig.whenComplete(() => print('Image Orig uploaded'));
//   await uploadTaskThumbnail
//       .whenComplete(() => print('Image Thumbnail uploaded'));
//  // await uploadTaskCompressed
//  //     .whenComplete(() => print('Image Compressed uploaded'));
//  await uploadTaskClipped
//      .whenComplete(() => print('Image Clipped uploaded'));
//   Directory appDirectory = await getApplicationDocumentsDirectory();
//   //String fileName = _clippedImage.path.split('/').last;
//   String savedImagePath = '${appDirectory.path}/$fileName';
//   File(imageFile!.path).copy(savedImagePath);

//   return storageReferenceClipped;
// }






// Future<Reference> saveImageToCloudStorage(XFile imageFile) async {
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
//   return storageReference;
// }




  // Create a new File to save the clipped image
//   final appDir = await getApplicationDocumentsDirectory();
//   final clippedImageFile = File('${appDir.path}/${imageFile.path.split('/').last.replaceAll('.jpg', '_clipped.jpg')}');

//   // Save the clipped image to the new File
//   clippedImageFile.writeAsBytesSync(img.encodeJpg(clippedImage));

//   return clippedImageFile;
// }

Future<File?> getImageFile(String storagePath) async {
  final tempDir = await getTemporaryDirectory();
  final fileName = storagePath.split('/').last;
  final file = File('${tempDir.path}/$fileName');

  // If the file do not exists try to download
  if (!file.existsSync()) {
    //if (true) {
    try {
      file.create(recursive: true);

      final ref = FirebaseStorage.instance.ref(storagePath);
      await ref.writeToFile(file);
      //  await FirebaseStorage.instance.ref(storagePath).writeToFile(file);
    } catch (e) {
      // If there is an error delete the created file
      await file.delete(recursive: true);
      return null;
    }
  }
  return file;
}


class AvatarImage extends StatelessWidget {
  final String storagePath;

  //const CheckInContainer({super.key});
  const AvatarImage({required this.storagePath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: getImageFile(storagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while fetching the file.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Text('No image available');
        } else {
          // Create an ImageProvider from the fetched File.
          final imageProvider = FileImage(snapshot.data!);

          // Use the imageProvider with an Image widget or any other widget that accepts an ImageProvider.
          return CircleAvatar(radius: 40.0, backgroundImage: imageProvider);
        }
      },
    );
  }

  // @override
  // Future<Object> obtainKey(ImageConfiguration configuration) {
  //   // TODO: implement obtainKey
  //   throw UnimplementedError();
  // }
}

// Future<void> downloadFile(String storagePath, File localFile) async {
//   try {
//     final Reference storageReference =
//         FirebaseStorage.instance.ref(storagePath);

//     // Check if the file exists.
//     final bool doesExist = await storageReference.exists();

//     if (doesExist) {
//       // If the file exists, download it to the local file.
//       await storageReference.writeToFile(localFile);
//       print('File downloaded successfully.');
//     } else {
//       print('File does not exist.');
//       // Handle the case where the file is missing, e.g., show an error message.
//     }
//   } catch (e) {
//     print('Error downloading file: $e');
//     // Handle other potential errors that might occur during the download.
//   }
// }

Future<File> createThumbnail(File imageFile, int width, int height) async {
  final bytes = await imageFile.readAsBytes();
  final originalImage = img.decodeImage(bytes);

  if (originalImage == null) {
    throw Exception("Failed to decode the image.");
  }

  // Resize the image to the desired dimensions (thumbnail size)
  final thumbnail = img.copyResize(originalImage, width: width, height: height);

  // Create a new File to save the thumbnail
  final thumbnailFile = File(imageFile.path.replaceAll(
      '.jpg', '_thumbnail.jpg')); // Adjust the file extension as needed

  // Save the thumbnail to the new File
  thumbnailFile.writeAsBytesSync(img.encodeJpg(thumbnail));

  return thumbnailFile;
}


Future<File> createCropCircle(File imageFile, int quality) async {
  final bytes = await imageFile.readAsBytes();
  final originalImage = img.decodeImage(bytes);
  developer.log('createCropCircle start' );

  if (originalImage == null) {
    throw Exception("Failed to decode the image.");
  }
   int size = originalImage.width < originalImage.height
      ? originalImage.width
      : originalImage.height;

  double result = size /2; // pi; // Divide by Pi

  int radiusSize = result.round();
  //int radiusSize = 1000;

  developer.log('originalImage.width ${originalImage.width}' );
  developer.log('originalImage.height ${originalImage.height}' );



  // Resize the image to the desired dimensions (thumbnail size)
  final cropCircle = img.copyCropCircle(originalImage, radius: radiusSize);


  // Create a new File to save the thumbnail
  final cropCirclelFile = File(imageFile.path.replaceAll(
      '.jpg', '_thumbnail.jpg')); // Adjust the file extension as needed

  // Save the thumbnail to the new File
  cropCirclelFile.writeAsBytesSync(img.encodeJpg(cropCircle,quality: quality));
  developer.log('createCropCircle end' );


  return cropCirclelFile;
}



// Future<File> createClippedCircle(File imageFile) async {
//   final bytes = await imageFile.readAsBytes();
//   final originalImage = img.decodeImage(bytes);

//   if (originalImage == null) {
//     throw Exception("Failed to decode the image.");
//   }

//   // Ensure the image is a square by selecting the smaller dimension
//   final size = originalImage.width < originalImage.height
//       ? originalImage.width
//       : originalImage.height;

//   // Create a circular mask
//   final mask = img.Image(size, size);
//   img.fill(mask, img.getColor(255, 255, 255, 0)); // Transparent

//   // Draw the clipped image as a circle
//   img.drawCircle(mask, size ~/ 2, size ~/ 2, size ~/ 2, img.getColor(255, 255, 255, 255));

//   // Apply the circular mask to the original image
//   final clippedImage = img.copyCrop(originalImage, 0, 0, size, size);
//   img.blit(clippedImage, mask);

//   // Create a new File to save the clipped image
//   final clippedImageFile = File(imageFile.path.replaceAll('.jpg', '_clipped.jpg')); // Adjust the file extension as needed

//   // Save the clipped image to the new File
//   clippedImageFile.writeAsBytesSync(img.encodeJpg(clippedImage));

//   return clippedImageFile;
// }





