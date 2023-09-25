import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data'; // Import the 'dart:typed_data' library

Future<String?> saveClippedImage(XFile sourceImage) async {
  final image = img.decodeImage(File(sourceImage.path).readAsBytesSync());

  // Create a circular mask
  final mask = img.Image(image!.width, image.height);
  img.fill(mask, img.getColor(255, 255, 255, 0)); // Transparent

  // Draw the clipped image
  img.drawCircle(mask, image.width ~/ 2, image.height ~/ 2,
      (image.width / 2).round(), img.getColor(255, 255, 255, 255));

  // Resize the clipped image to a square
  final clippedImage = img.copyCrop(mask, 0, 0, image.width, image.height);

  // Get the directory for saving the clipped image
  final appDir = await getApplicationDocumentsDirectory();
  final clippedImagePath = '${appDir.path}/${sourceImage.name}';

  // Save the clipped image to the file system
  File(clippedImagePath).writeAsBytesSync(img.encodePng(clippedImage));

  return clippedImagePath;
}

// ...

Future<Uint8List?> compressImage(String imagePath, {int quality = 40}) async {
  final imageBytes = File(imagePath).readAsBytesSync();
  final compressedImage = img.decodeImage(imageBytes);

  if (compressedImage != null) {
    final compressedImageData =
        img.encodeJpg(compressedImage, quality: quality);
    return Uint8List.fromList(
        compressedImageData); // Convert List<int> to Uint8List
  }

  return null;
}

Future<void> uploadImageToCloudStorage(
    String imagePath, bool createThumbnail) async {
  final storage = FirebaseStorage.instance;
  final reference = storage
      .ref()
      .child('images')
      .child(createThumbnail ? 'thumbnails' : 'originals')
      .child(createThumbnail
          ? 'thumbnail_${DateTime.now().millisecondsSinceEpoch}.jpg'
          : 'image_${DateTime.now().millisecondsSinceEpoch}.jpg');

  final compressedImageData = await compressImage(imagePath);

  if (compressedImageData != null) {
      final metadata = SettableMetadata(contentType: 'image/jpeg');

    await reference.putData(compressedImageData,metadata);
  }
 

}

Future<Uint8List?> fetchImageFromCloudStorage(bool isThumbnail) async {
  final storage = FirebaseStorage.instance;
  final reference = storage
      .ref()
      .child('images')
      .child(isThumbnail ? 'thumbnails' : 'originals')
      .child('your_image_file_name_here.jpg');

  final imageBytes = await reference.getData();
  return imageBytes;
}

//final sourceImage = await ImagePicker().pickImage(source: ImageSource.gallery);

Future<String?> writeimage(XFile? sourceImage) async {
  if (sourceImage != null) {
    String? clippedImagePath = await saveClippedImage(sourceImage);
    if (clippedImagePath != null) {
      await uploadImageToCloudStorage(
          clippedImagePath, false); // Upload original
      await uploadImageToCloudStorage(
          clippedImagePath, true); // Upload thumbnail
    }
      return clippedImagePath;
  }
  


// To fetch the original image
//final originalImageBytes = await fetchImageFromCloudStorage(false);

// To fetch the thumbnail
//final thumbnailImageBytes = await fetchImageFromCloudStorage(true);
}
