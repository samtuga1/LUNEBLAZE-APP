import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:luneblaze_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  void navigateToPrivacy(BuildContext context) {
    // Moves to privacy screen
    context.router.push(const PrivacySettingsView());
  }

  void navigateToCommunity() {
    // Moves to community screen
  }

  void navigateToManagePage() {
    // Moves to manaage screen
  }
  void navigateToInternship() {
    // Moves to internship screen
  }
  void navigateToAbout() {
    // Moves to about screen
  }
  void navigateToPrivacyPolicy() {
    // Moves to privacy policy screen
  }
  void navigateToSessionPolicy() {
    // Moves to session policy screen
  }
  void navigateToTermsOfUse() {
    // Moves to terms of use screen
  }
  void navigateToReport() {
    // Moves to report screen
  }
  void contactUs() {
    // Moves to contact us screen
  }
  void logout() {
    // Logs user out
  }
}
