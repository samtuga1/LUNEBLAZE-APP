import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.router.dart';

class SettingsViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  void navigateToPrivacy() async {
    await navigation.navigateTo(Routes.privacySettingsView);
  }

  void goBack() {
    navigation.popRepeated(0);
  }

  void navigateToCommunity() {
    // Moves to community screen
  }

  void navigateToManagePage() {
    // Moves to manaage screen
  }
  void navigateToGetNotified() {
    navigation.navigateTo(Routes.getNotifiedView);
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
