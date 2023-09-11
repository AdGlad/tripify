import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gtk_flutter/model/placehistory.dart';

Future<PlaceHistory?> fetchPlacehistoryDoc(String placehistoryId) async {
PlaceHistory? placehistory;
try {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('currentuser').doc(FirebaseAuth.instance.currentUser!.uid).collection('country').doc('sc').collection('region').doc('reg').collection('placehistory').doc(placehistoryId).get();

    if (documentSnapshot.exists) {
      // Document with ID '1234' exists, and you can access its data.
      final Map<String, dynamic> data = documentSnapshot.data()!;
      print('Document Data: $data');
      placehistory= PlaceHistory.fromJson(data);
    } else {
      // Document with ID '1234' does not exist.
      print('Document does not exist.');
    }
  } catch (e) {
    print('Error fetching document: $e');
  }
  //try {
    // Replace 'placehistory' with the name of your collection and '1234' with the desired document ID.
   // final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
   // final QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        //await FirebaseFirestore.instance.collection('placehistory').doc(placehistoryId).get();
       // await FirebaseFirestore.instance.collection('placehistory').doc('10reFHRYYtJIc49WRqib').get();
 //await FirebaseFirestore.instance.collectionGroup('placehistory')
  //     .where('id', isEqualTo: '10reFHRYYtJIc49WRqib').get();


// final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
//           .collectionGroup('placehistory') // Use your collection group name here
//           .where(FieldPath.documentId, isEqualTo: placehistoryId) // Specify the document ID
//           .get();

// if (snapshot.docs.isNotEmpty) {
//         final DocumentSnapshot<Map<String, dynamic>> document = snapshot.docs.first;
//         final data = document.data();
//        // Map<String, Object?> data = document.data() as Map<String, Object?>;
//         // Process the data from the document here
//         print(data);
//         placehistory= PlaceHistory.fromJson(data as Map<String, Object?> );
//       } else {
//         // Document with ID '1234' not found
//         print('Document not found.');
//       }
//     } catch (e) {
//       print('Error fetching document: $e');
//     }


  //   if (snapshot.docs.isNotEmpty) {
  //     // The document with the specified ID exists.
  //     final DocumentSnapshot<Map<String, Object>> document = snapshot.docs.first;
  //       final data = document.data();
  //    // final Map<String, dynamic> data = documentSnapshot.data()!;
  //     print('Document Data: $data');
  //      placehistory= PlaceHistory.fromJson(data);
  //   } else {
  //     // The document does not exist.
  //     print('Document does not exist.');
  //   }
  // } catch (e) {
  //   print('Error fetching document: $e');
  // }
 
  return placehistory;



}