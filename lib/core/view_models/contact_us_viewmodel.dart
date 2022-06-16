import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:luneblaze_app/core/services/api_services.dart';

class ContactUsViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  void selectIssueType(String value) {
    currentIssue = value;
    notifyListeners();
  }

  int descriptionLength = 0;

  Future<void> validateAndReport() async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      loading = true;
      notifyListeners();
      try {
        final response =
            await api_services.create().postReportsAndContactUsData({
          'type': 'contact_us',
          'section': currentIssue,
          'user_id': '3',
          'description': description,
        });
        log(response.statusCode.toString());
        loading = false;
        navigation.popRepeated(1);
        notifyListeners();
      } catch (error) {
        loading = false;
        // Handling of exceptions
      }
    }
  }

  void increase_description_length(int valueLength) {
    descriptionLength = valueLength;
    notifyListeners();
  }

  String description = '';

  List<String> issueType = [
    'User',
    'Organization',
    'Institution',
  ];

  String currentIssue = 'User';
  void goBack() {
    navigation.popRepeated(1);
  }
}
