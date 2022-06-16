import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> pickImage(bool sourceType) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: sourceType ? ImageSource.camera : ImageSource.gallery);
    File? imagePath = File(image!.path);
    return imagePath;
  }
}
