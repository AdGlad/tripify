// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import '../model/placehistory.dart';


// // Future<List> getImagePaths(String documentId) async {

// // DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
// //       .collection('placehistory')
// //       .doc(documentId)
// //       .get();
// //   if (snapshot.exists) {
// //     return snapshot.data()!['imagePaths'] as List<dynamic>;
// //   }
// //   return [];

//   // CollectionReference<Map<String, dynamic>> imagesCollection =
//   //     FirebaseFirestore.instance.collection('images');
//   // return imagesCollection.snapshots().map((snapshot) {
//   //   if (snapshot.docs.isNotEmpty) {
//   //     return snapshot.docs.first.get('imagePaths') as List<dynamic>;
//   //   }
//   //   return [];
//   // });
// //}

// Future<List<dynamic>> fetchImagePaths(String documentId) async {
//   DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
//       .collectionGroup('placehistory')
//    //   .collection('placehistory')
//       .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//       .doc(documentId)
//       .get();

//   if (snapshot.exists) {
//     return snapshot.data()!['imagePaths'] as List<dynamic>;
//   }
//   return [];
// }

// class ImageGallery extends StatelessWidget {
//   final PlaceHistory places;
//  // final String documentId;

//   ImageGallery({required this.places});

//   @override
//   Widget build(BuildContext context) {
//     return 
//     //FutureBuilder<List<dynamic>>(
//     //  future: fetchImagePaths(documentId),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<dynamic> imagePaths = snapshot.data!;
//           return ListView.builder(
//             itemCount: imagePaths.length,
//             itemBuilder: (context, index) {
//               String imagePath = imagePaths[index] as String;
//               return CachedNetworkImage(
//                 imageUrl: imagePath,
//                 placeholder: (context, url) => CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               );
//             },
//           );
//         }
//         return CircularProgressIndicator();
//       };
// //    );
//   }
// }


// // class PhotoGallery extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<List<dynamic>>(
// //     //  stream: getImagePaths(),
// //       future: getImagePaths(),
// //       builder: (context, snapshot) {
// //         if (snapshot.hasData) {
// //           List<dynamic> imagePaths = snapshot.data!;
// //           return GridView.builder(
// //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //               crossAxisCount: 3,
// //               crossAxisSpacing: 4.0,
// //               mainAxisSpacing: 4.0,
// //             ),
// //             itemCount: imagePaths.length,
// //             itemBuilder: (context, index) {
// //               String imagePath = imagePaths[index] as String;
// //               return GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => PhotoView(
// //                         imageProvider: AssetImage(imagePath),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //                 child: Image.asset(
// //                   imagePath,
// //                   fit: BoxFit.cover,
// //                 ),
// //               );
// //             },
// //           );
// //         }
// //         return CircularProgressIndicator();
// //       },
// //     );
// //   }
// // }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Photo Gallery'),
//         ),
//         body: ImageGallery( documentId: 'Y9yviPMmXlk8eFfNRld3'),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageGallery extends StatelessWidget {
  List<String> imagePaths;
  //final List<String> imagePaths;

  ImageGallery({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
   // List<String> imagePaths = convertStringToList(imagePathArray);

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body:
    GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust the number of columns as per your preference
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        String imagePath = imagePaths[index];
        return PhotoView(
                        imageProvider: AssetImage(imagePath));
    
        // GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => PhotoView(
        //                 imageProvider: AssetImage(imagePath),
        //               ),
        //             ),
        //           );
        //         }
        // );
      }
    )
    );
  }
        // GestureDetector(
        //   onTap: () {
        //     // Implement any action you want when an image is tapped
        //   },
        //   child: CachedNetworkImage(
        //     imageUrl: imagePath,
        //     placeholder: (context, url) => CircularProgressIndicator(),
        //     errorWidget: (context, url, error) => Icon(Icons.error),
        //   ),
        // );
      //},
    //);
 // };
  
}
