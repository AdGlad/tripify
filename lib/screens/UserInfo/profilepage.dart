import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/model/usertotals.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:gtk_flutter/screens/UserInfo/cropImage.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../../state/applicationstate.dart';

class ProfilePage1 extends StatefulWidget {
  UserProfile userProfile;

  ProfilePage1(this.userProfile, {Key? key}) : super(key: key);

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  String? _avatar = '';
  //  bool? _avatarNew =false;

  @override
  void initState() {
    super.initState();
    _avatar = widget.userProfile.avatar!;
  }

  void updateAvatar(String newAvatar) async {
    developer.log('updateAvatar: $newAvatar');

    setState(() async {
      //  _avatarNew =true;

      _avatar = newAvatar;
      Reference avatarReference = await saveImagePathToCloudStorage(newAvatar);
      _saveUserAvatar(avatarReference.fullPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, _) => Scaffold(
              appBar: AppBar(
                title: Text('Profile',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
              ),
              body: Column(
                children: [
                  //  Expanded(flex: 2, child: _TopPortion(_avatarNew!,_avatar!)),
                  Expanded(
                      flex: 2,
                      child: _TopPortion(appState.userProfile?.avatar ?? '')),
                  //   Expanded(flex: 2, child: _TopPortion(_avatar!)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            appState.userProfile?.nickname ?? 'No nickname',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            child: ElevatedButton(
                              style: ButtonStyle(

                                  ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CropPage(
                                      title: 'Crop Page',
                                      currentAvatar:
                                          _avatar!, // Pass the current avatar to CropPage
                                      updateAvatar:
                                          updateAvatar, // Pass the callback function
                                    ),
                                  ),
                                );
                              },
                              child: Text('Change Avatar'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.extended(
                                onPressed: () {},
                                heroTag: 'follow',
                                elevation: 0,
                                label: const Text("Follow"),
                                icon: const Icon(Icons.person_add_alt_1),
                              ),
                              const SizedBox(width: 16.0),
                              FloatingActionButton.extended(
                                onPressed: () {},
                                heroTag: 'mesage',
                                elevation: 0,
                                backgroundColor: Colors.red,
                                label: const Text("Message"),
                                icon: const Icon(Icons.message_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const _ProfileInfoRow()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Posts", 900),
    ProfileInfoItem("Followers", 120),
    ProfileInfoItem("Following", 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  //final bool newAvatar;
  final String storagePath;
  _TopPortion(
      //this.newAvatar,
      this.storagePath,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  child: AvatarImage(storagePath: storagePath),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
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
