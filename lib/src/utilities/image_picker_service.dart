import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> pickMultipleImages() async {
    List<XFile> pickedImages = await _picker.pickMultiImage();

    return pickedImages;
  }

  Future<XFile?> pickImage(ImageSource? imageSource) async {
    XFile? pickedImage =
        await _picker.pickImage(source: imageSource ?? ImageSource.camera);

    return pickedImage;
  }
}
