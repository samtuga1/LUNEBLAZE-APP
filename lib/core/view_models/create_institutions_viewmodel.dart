import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:luneblaze_app/core/services/api_services.dart';

import '../../app/app.router.dart';

class CreateInstitutionsViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final navigation = locator<NavigationService>();
  int institutionNameLength = 0;
  bool loading = false;
  bool switchCollege = false;
  String institutionName = '';
  String businessEmail = '';
  String businessPhone = '';
  String website = '';

  Future<void> validateAndRegister() async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      loading = true;
      notifyListeners();
      try {
        final response = await api_services.create().postInstitutionData({
          'user_id': '1',
          'venue_name': institutionName,
          'venue_email': businessEmail,
          'venue_contact': businessPhone,
          'website_link': website,
          'is_college': switchCollege ? '1' : '0',
        });
        loading = false;
        navigation.navigateTo(Routes.otpView);
        notifyListeners();
      } catch (error) {
        loading = false;
        notifyListeners();
        log(error.toString());
        // Handling of exceptions
      }
    }
  }

  void toggleInstitutionNameLength(int valueLength) {
    institutionNameLength = valueLength;
    notifyListeners();
  }

  void goBack() {
    navigation.popRepeated(1);
  }

  void switchCollegePressed(value) {
    switchCollege = value;
    notifyListeners();
  }
}
