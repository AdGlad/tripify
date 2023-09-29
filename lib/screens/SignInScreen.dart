import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;

import 'package:go_router/go_router.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:http/http.dart' as http;

//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:gtk_flutter/src/ad_helper.dart';

Future<http.Response> downloadImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  return response;
}

Future<String?> uploadImageToFirestore(String image, String userId) async {
  //try {

    final response = await downloadImage(image);
    final imageBytes = response.bodyBytes;
    final filename = 'avatar_'+ userId +'.jpg';
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('images').child(filename); // Specify the desired storage path
    final xfileAvatar = await uint8ListToXFile(imageBytes,filename);
    //final storageReference = await saveImageToCloudStorage( xfileAvatar!, 'Compress');
    final storageReference = await saveImageToCloudStorage( xfileAvatar!, 'CropCircle');

    final fullPath = storageReference.fullPath;
   // final uploadTask = ref.putData(imageBytes);

   // await uploadTask.whenComplete(() => null);

    //final imageUrl = await ref.getDownloadURL();
    //return imageUrl;
//  } catch (e) {
 //   print('Error uploading image to Firestore: $e');
 //   return null;
 // }
    return fullPath;

}


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

//String? imageUrl;
String? avatar_path;
  @override
  Widget build(BuildContext context) {
    return Container(
        //alignment: Alignment.centerLeft,
        child: SignInScreen(
      desktopLayoutDirection: TextDirection.ltr,
      resizeToAvoidBottomInset: false,

      oauthButtonVariant: OAuthButtonVariant.icon,
      // providers:
      //   //EmailProviderConfiguration(),
      //   //FacebookProviderConfiguration( clientId: "1dae917812269b6ffe95a586db98aca8"),
      //   //GoogleProviderConfiguration( clientId: "90817750920-9307of40hl4eg62dabtvcd403s6pg5a8.apps.googleusercontent.com"),
      //    EmailProvider(),
      //   FacebookProvider(clientId: "1dae917812269b6ffe95a586db98aca8"),
      //   GoogleProvider(
      //       clientId:
      //           "90817750920-9307of40hl4eg62dabtvcd403s6pg5a8.apps.googleusercontent.com"),
      // ,
      actions: [
        ForgotPasswordAction(((context, email) {
          final uri = Uri(
            path: '/forgot-password',
            queryParameters: <String, String?>{
              'email': email,
            },
          );
          context.push(uri.toString());
        })),
        AuthStateChangeAction(((context, state) async {
          if (state is SignedIn || state is UserCreated) {
            var user = (state is SignedIn)
                ? state.user
                : (state as UserCreated).credential.user;
            if (user == null) {
              return;
            }
            if (state is UserCreated) {
              // Create profile record

              if (user.photoURL != null)
              {
                avatar_path = await uploadImageToFirestore(user.photoURL!,user.uid );
              // avatar_path = 'images/avatar_'+ user.uid +'.jpg';  
               //avatar_path = avatarReference.fullPath;  
              } else {
                avatar_path = 'images/Quokka-Avatar.png';
              }
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .set({
                // set({
                'userId': FirebaseAuth.instance.currentUser!.uid,
                'nickname': (user.displayName ?? 'nickname').toLowerCase(),
                'email': user.email ?? 'email',
             //   'avatar': user.photoURL ?? 'images/0qlNcVgclFZNSASXXPbX44ae1vo2/avatar/avatar_image_cropper_98290CA2-814D-4DAA-8075-05CAB4DBB10F-12470-0000064D2AB5DF33.jpg',
                'avatar': avatar_path,
                // 'age': int.parse(_ageController.text),
                'friend': 0,
                'league': 0,
                'language': 'en',
                'joinDate': DateTime.now(),
                'countrycount': 0,
                'visitcount': 0,
                'distancetotal': 0,
                'regioncount': 0,
                'placescount': 0,
                'currentstreak': 1,
                'lastRecordedDate': DateTime.now(),

              });

              // user.updateDisplayName(user.email!.split('@')[0]);
            }
            if (!user.emailVerified) {
              user.sendEmailVerification();
              const snackBar = SnackBar(
                  content: Text(
                      'Please check your email to verify your email address'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            context.pushReplacement('/');
          }
        })),
      ],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(1),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/quokka1.png'),
          ),
          //AspectRatio(aspectRatio: 1, child: Text("Hello")),
          // Image.asset('assets/Quokka-PNG-Pic.png')
          //  Image.asset('assets/travel.png')
          //  Image.asset('assets/quokka1.png')
          //),
        );
      },
      // subtitleBuilder: (context, action) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 4.0),
      //     child: action == AuthAction.signIn
      //         ? const Text(
      //             style: TextStyle(fontSize: 5),
      //             'Welcome to Tripify, please sign in!')
      //         : const Text(
      //             style: TextStyle(fontSize: 5),
      //             'Welcome to Tripify, please sign up!'),
      //   );
      // },
      footerBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            'By signing in, you agree to our terms and conditions.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
      // sideBuilder: (context, shrinkOffset) {
      //   return Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: AspectRatio(aspectRatio: 1, child: Text("Bye")
      //         //Image.asset('flutterfire_300x.png'),
      //         ),
      //   );
      // },
    ));
  }
}
