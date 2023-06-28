import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile({
    required XFile file,
    required String clientId,
  }) async {
    final path = "files/image/$clientId/${DateTime.now()}";

    final ref = _storage.ref().child(path);

    Uint8List imageData = await file.readAsBytes();

    var metadata = SettableMetadata(contentType: "image/png");

    UploadTask uploadTask = ref.putData(imageData, metadata);

    final snapshot = await uploadTask.whenComplete(() {});

    final fileUrl = await snapshot.ref.getDownloadURL();

    return fileUrl;
  }
}
