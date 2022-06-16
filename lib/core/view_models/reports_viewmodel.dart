import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:luneblaze_app/core/services/api_services.dart';
import 'package:luneblaze_app/core/services/image_picker_service/image_picker_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class ReportsViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  final navigation = locator<NavigationService>();
  final imageService = locator<ImagePickerService>();
  File? imagePicked;
  File? get imagePick => imagePicked;

// Image picker
  void pickImage() async {
    final imageFile = await imageService.pickImage(false);
    if (imageFile == null) {
      return;
    } else {
      imagePicked = imageFile;
      log(imagePicked!.path.toString());
    }

    notifyListeners();
  }

  // Posting requesting
  Future<void> validateAndReport() async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      loading = true;
      notifyListeners();
      try {
        final response =
            await api_services.create().postReportsAndContactUsData({
          'type': 'report_bugs',
          'section': currentIssue,
          'user_id': '3',
          'description': description ?? '',
        });
        loading = false;
        navigation.popRepeated(1);
        notifyListeners();
      } catch (error) {
        loading = false;
        // Handling of exceptions
      }
    }
  }

  int descriptionLength = 0;
  // ignore: non_constant_identifier_names
  void increase_description_length(int valueLength) {
    descriptionLength = valueLength;
    notifyListeners();
  }

  String currentIssue = 'Suspicious or Fake';
  String? description;

  List issueType = [
    'Suspicious or Fake',
    'Harassment or Hateful Speech',
    'Violence or Physical Harm',
    'Adult Content',
    'Ip Infringement'
  ];
  void selectIssueType(String value) {
    currentIssue = value;
    notifyListeners();
  }

  void selectImage() {
    // Select image
  }

  void goBack() {
    navigation.popRepeated(1);
  }
}
