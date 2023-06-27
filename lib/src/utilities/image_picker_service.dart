import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<List<File>> pickMultipleImages() async {
    List<XFile> pickedImages = await _picker.pickMultiImage();

    return pickedImages.map<File>((image) => File(image.path)).toList();
  }

  Future<File?> pickImage(ImageSource? imageSource) async {
    XFile? pickedImage =
        await _picker.pickImage(source: imageSource ?? ImageSource.camera);

    return pickedImage == null ? null : File(pickedImage.path);
  }
}
