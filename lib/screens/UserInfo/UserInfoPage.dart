import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
import 'package:gtk_flutter/screens/findfriendpage.dart';
import 'package:provider/provider.dart';
//import 'package:toggle_switch/toggle_switch.dart';
import '../../src/acceptfriendrequests.dart';
import '../poiToVisitList.dart';
import 'listfriends.dart';
import '../../state/applicationstate.dart';

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
                padding: EdgeInsets.all(5),
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: _avatar == null
                          ? null //FileImage(_imageFile)
                          : _avatar != null
                              ? NetworkImage(_avatar!)
                              : null,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    // onChanged: ,
                    //  initialValue: "adam",
                    //  initialValue: appState.userProfile?.nickname,
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
                            builder: (context) => PoiToVisitList(),
                          ),
                        );

                        //   Navigator.of(context)
                        //       .pushReplacementNamed('/findfriends');
                        // Navigator.of(context).pushReplacementNamed('/findfriends');
                        //   Navigator.pushNamed(context, 'findfriends');
                        //  Navigator.push(context, '/findfriends');
                      },
                      child: Text('Bucket List '),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(16.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: [
                  //       Text(
                  //         'Title',
                  //         style:
                  //             TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  //       ),
                  //       SizedBox(height: 16.0),
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               color: Colors.blue,
                  //               height: 100.0,
                  //               child: Center(
                  //                 child: Text(
                  //                   'Sub Container 1',
                  //                   style: TextStyle(
                  //                     fontSize: 16.0,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(width: 16.0),
                  //           Expanded(
                  //             child: Container(
                  //               color: Colors.green,
                  //               height: 100.0,
                  //               child: Center(
                  //                 child: Text(
                  //                   'Sub Container 2',
                  //                   style: TextStyle(
                  //                     fontSize: 16.0,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(height: 16.0),
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               color: Colors.yellow,
                  //               height: 100.0,
                  //               child: Center(
                  //                 child: Text(
                  //                   'Sub Container 3',
                  //                   style: TextStyle(
                  //                     fontSize: 16.0,
                  //                     color: Colors.black,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(width: 16.0),
                  //           Expanded(
                  //             child: Container(
                  //               color: Colors.orange,
                  //               height: 100.0,
                  //               child: Center(
                  //                 child: Text(
                  //                   'Sub Container 4',
                  //                   style: TextStyle(
                  //                     fontSize: 16.0,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
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
