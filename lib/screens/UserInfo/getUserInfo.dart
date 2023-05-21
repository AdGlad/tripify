import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
   // _email = user?.email;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    if (userData.exists) {
      setState(() {
        if (userData.data()!.containsKey('nickname')) {
          _nicknameController.text = userData['nickname'] ?? user.displayName;
        }
        // if (userData.data()!.containsKey('email')) {
        //   _email = userData['email'];
        // } else {
        //   _email = user.email;
        // }

        // if (userData.data()!.containsKey('friend')) {
        //   _friendable = userData['friend'];
        // } else {
        //   _friendable = 1;
        // }

        // if (userData.data()!.containsKey('league')) {
        //   _league = userData['league'];
        // } else {
        //   _league = 1;
        // }

        // if (userData.data()!.containsKey('avatar')) {
        //   _avatar = userData['avatar'];
        // } else {
        //   _avatar = "";
        // }

        //  _ageController.text = userData['age'].toString();
        // _friendable = userData['friend'] ?? 1;
        // _league = userData['league'] ?? 1;
      });
    }
  }
