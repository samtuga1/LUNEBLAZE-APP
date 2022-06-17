import 'package:flutter/cupertino.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateInstitutionsViewModel extends BaseViewModel {
  bool switchCollege = false;
  final formKey = GlobalKey<FormState>();
  final navigation = locator<NavigationService>();
  int institutionNameLength = 0;
  void toggleInstitutionNameLength(int valueLength) {
    institutionNameLength = valueLength;
    notifyListeners();
  }

  void goBack() {
    navigation.popRepeated(1);
  }

  void validateAndRegister() {
    formKey.currentState!.validate();
  }

  void switchCollegePressed(value) {
    switchCollege = value;
    notifyListeners();
  }
}
