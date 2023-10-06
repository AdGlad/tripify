import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;

// ...

Future<Position?> geoposition() async {

          developer.log('geoposition In');

  Position? position;
  try {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
  } catch (e) {
    print("Error getting location: $e");
              developer.log('"Error getting location: $e"');

    // Handle location error or provide default location
  }

return position;
  // Now you can add `newUserProfile` to Firestore
}
