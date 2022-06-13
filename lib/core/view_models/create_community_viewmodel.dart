import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateCommunityViewModel extends BaseViewModel {
  final navigation = NavigationService();
  final formKey = GlobalKey<FormState>();

  // Add community click event
  // ignore: non_constant_identifier_names
  void add_community() {
    formKey.currentState!.validate();
  }

  // ignore: non_constant_identifier_names
  int community_name_length = 0;
  // ignore: non_constant_identifier_names
  void toggle_community_name_length(int value_length) {
    community_name_length = value_length;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  int bio_length = 0;
  // ignore: non_constant_identifier_names
  void toggle_bio_length(int value_length) {
    bio_length = value_length;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  int description_length = 0;
  // ignore: non_constant_identifier_names
  void toggle_description_length(int value_length) {
    description_length = value_length;
    notifyListeners();
  }

  void goBack() {
    navigation.popRepeated(1);
  }
}
