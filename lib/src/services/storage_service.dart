import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile({
    required File file,
    required String clientId,
  }) async {
    final path = "files/images/$clientId/${DateTime.now()}.png";

    final ref = _storage.ref().child(path);

    UploadTask uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});

    final fileUrl = await snapshot.ref.getDownloadURL();

    return fileUrl;
  }
}
