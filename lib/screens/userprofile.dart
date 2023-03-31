import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:developer' as developer;

//import 'package:firebase_storage/firebase_storage.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  //final _ageController = TextEditingController();
  int _friendable = 0;
  int _league = 0;
  String _errorMessage = '';
  String? _email;
  String? _avatar;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    _email = user?.email;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    if (userData.exists) {
      setState(() {
        if (userData.data()!.containsKey('nickname')) {
          _nicknameController.text = userData['nickname'] ?? user.displayName;
        }
        if (userData.data()!.containsKey('email')) {
          _email = userData['email'];
        } else {
          _email = user.email;
        }

        if (userData.data()!.containsKey('friend')) {
          _friendable = userData['friend'];
        } else {
          _friendable = 1;
        }

        if (userData.data()!.containsKey('league')) {
          _league = userData['league'];
        } else {
          _league = 1;
        }

        if (userData.data()!.containsKey('avatar')) {
          _avatar = userData['avatar'];
        } else {
          _avatar = "";
        }

        //  _ageController.text = userData['age'].toString();
        // _friendable = userData['friend'] ?? 1;
        // _league = userData['league'] ?? 1;
      });
    }
  }

  Future<void> _saveUserInfo() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('nickname', isEqualTo: _nicknameController.text)
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
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'nickname': _nicknameController.text,
        'email': _email,
        // 'age': int.parse(_ageController.text),
        'friend': _friendable,
        'league': _league,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: _avatar == null
                    ? null //FileImage(_imageFile)
                    : _avatar != null
                        ? NetworkImage(_avatar!)
                        : null,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nicknameController,
              decoration: InputDecoration(labelText: 'Nickname'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a nickname';
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
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            Text("Appear in the league tables?"),

            ToggleSwitch(
              initialLabelIndex: _friendable,
              totalSwitches: 2,
              labels: ['Yes', 'No'],
              onToggle: (index) {
                setState(() {
                  _friendable = index!;
                  // if (index == 0) {
                  //   _Friendable = true;
                  // } else {
                  //   _Friendable = false;
                  // }
                });
              },
            ),
            SizedBox(height: 16),
            Text("Allow others to friend you?"),
            ToggleSwitch(
              initialLabelIndex: _league,
              totalSwitches: 2,
              labels: ['Yes', 'No'],
              onToggle: (index) {
                setState(() {
                  _league = index!;

                  // if (index == 0) {
                  //   _League = 0;
                  // } else {
                  //   _League = 1;
                  // }
                });
              },
            ),
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _saveUserInfo();
                  //     Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
// class NicknamePage extends StatefulWidget {
//   const NicknamePage({super.key});

//   @override
//   _NicknamePageState createState() => _NicknamePageState();
// }

// class _NicknamePageState extends State<NicknamePage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nicknameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _getNickname();
//   }

//   Future<void> _getNickname() async {
//     final user = FirebaseAuth.instance.currentUser;
//     final nickname = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get()
//         .then((doc) => doc.data()?['nickname']);
//     setState(() {
//       _nicknameController.text = nickname ?? '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Set Nickname'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nicknameController,
//                 decoration: InputDecoration(labelText: 'Nickname'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a nickname';
//                   }
//                   return null;
//                 },
//               ),

//               Checkbox(
//                 onChanged: _nicknameController,
//                 decoration: InputDecoration(labelText: 'Nickname'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a nickname';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _saveNickname,
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _saveNickname() async {
//     final user = FirebaseAuth.instance.currentUser;
//     await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
//       'nickname': _nicknameController.text.trim(),
//     }, SetOptions(merge: true));
//   }

//   // Future<void> _saveNickname() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     final user = FirebaseAuth.instance.currentUser;
//   //     final nickname = _nicknameController.text.trim();

//   //     await FirebaseFirestore.instance
//   //         .collection('users')
//   //         .doc(user!.uid)
//   //         .set({'nickname': nickname});

//   //     Navigator.pop(context);
//   //   }
//   // }

// }
