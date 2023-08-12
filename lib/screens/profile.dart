// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// //import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'package:firebase_auth/firebase_auth.dart'
// import 'package:firebase_auth/firebase_auth.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _aliasController = TextEditingController();
//   File? _image;
//   String? _imageUrl;

//   @override
//   void dispose() {
//     _aliasController.dispose();
//     super.dispose();
//   }

//   // Future<void> _pickImage() async {
//   //   final picker = ImagePicker();
//   //   try {
//   //     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   }

//   //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     _image = File(pickedFile!.path);
//   //   });
//   // }


// // File? image;
// // Future _pickImage() async {
// //     try {
// //        _image = await ImagePicker().pickImage(source: ImageSource.gallery);
// //        if(image == null) return;final imageTemp = File(image.path);setState(() => this.image = imageTemp);
// //     } on PlatformException catch(e) {
// //       print('Failed to pick image: $e');
// //     }
// //   }


//   Future<void> _uploadImage() async {
//     final storage = FirebaseStorage.instance;
//     final ref = storage.ref().child('avatars/${DateTime.now()}.jpg');
//     final metadata = SettableMetadata(contentType: 'image/jpeg');
//     final uploadTask = ref.putFile(_image, metadata);
//     final downloadUrl = await (await uploadTask).ref.getDownloadURL();
//     setState(() {
//       _imageUrl = downloadUrl;
//     });
//   }

//   Future<void> _updateProfile() async {
//     final firestore = FirebaseFirestore.instance;
//     final user = FirebaseAuth.instance.currentUser;
//     await firestore.collection('users').doc(user.uid).update({
//       'alias': _aliasController.text,
//       'avatar': _imageUrl,
//     });
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(16),
//           children: [
//             if (_imageUrl != null)
//               Image.network(
//                 _imageUrl,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             TextFormField(
//               controller: _aliasController,
//               decoration: InputDecoration(
//                 labelText: 'Alias',
//               ),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter your alias';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               child: Text('Choose Avatar'),
//               onPressed: _pickImage,
//             ),
//             SizedBox(height: 16),
//             if (_image != null)
//               ElevatedButton(
//                 child: Text('Upload Avatar'),
//                 onPressed: _uploadImage,
//               ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               child: Text('Update Profile'),
//               onPressed: _updateProfile,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
