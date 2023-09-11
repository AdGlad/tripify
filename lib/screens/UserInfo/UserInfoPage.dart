import 'dart:io';
//import 'dart:js_interop';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
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
        'avatar': _avatar,
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
                  Center(
                    child: GestureDetector(
                        onTap: () async {
                          // Add your onTap logic here
                          print('CircleAvatar tapped!');
                          XFile? avatarXFile =
                              await selectAndSaveImages(ImageSource.gallery);
                          Reference imagePath =
                              await saveImageToCloudStorage(avatarXFile!);
                          _avatar = imagePath.fullPath;
                          //_avatarFile = await getImageFile(_avatar!);
                          developer.log(
                              ' imageFile is not null ${imagePath.fullPath}   ');
                          _saveUserInfo();
                        },
child:  AvatarImage(storagePath:applicationState.userProfile!.avatar!)

                        ),
                  ),

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
                            builder: (context) => TopPoiList(),
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

Future<XFile?> selectAndSaveImages(ImageSource _imagesource) async {
  XFile? selectedImage = await ImagePicker().pickImage(source: _imagesource);
  if (selectedImage != null) {
    developer.log('selectedImage is not null ');

    return selectedImage;
  }
  // developer.log('imagePaths 3 Length ${selectedImages?[0]} ');
  // developer.log('imagePaths 4 Length $selectedImage ');
}

Future<Reference> saveImageToCloudStorage(XFile imageFile) async {
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

Future<File?> getImageFile(String storagePath) async {
  final tempDir = await getTemporaryDirectory();
  final fileName = storagePath.split('/').last;
  final file = File('${tempDir.path}/$fileName');

  // If the file do not exists try to download
  if (!file.existsSync()) {
  //if (true) {
    try {
      file.create(recursive: true);
    
      final ref =  FirebaseStorage.instance.ref(storagePath);
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

// class CircleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final radius = size.width / 2.0; // Assumes the width and height are the same

//     path.addOval(Rect.fromCircle(center: Offset(radius, radius), radius: radius));
    
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false; // In most cases, you don't need to recalculate the clip path
//   }
// }




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
          return CircleAvatar(
  radius: 40.0,
  backgroundImage: imageProvider);
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

