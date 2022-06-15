import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:luneblaze_app/core/services/api_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReportsViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  // Posting requesting
  Future<void> validateAndReport() async {
    formKey.currentState!.validate();
    loading = true;
    notifyListeners();
    try {
      log(loading.toString());
      final response = await api_services.create().postReportsAndContactUsData({
        'type': 'report_bugs',
        'section': currentIssue,
        'user_id': '3',
        'description': description ?? '',
      });
      log(response.statusCode.toString());
      loading = false;
      navigation.popRepeated(1);
      notifyListeners();
    } catch (error) {
      // Handling of exceptions
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

  final navigation = NavigationService();
  void goBack() {
    navigation.popRepeated(1);
  }
}
