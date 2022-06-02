import 'dart:developer';

import 'package:luneblaze_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../UIs/widgets/setup_dialog_ui.dart';

class PrivacySettingViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  bool twoStepVerify = false;
  void switchTwoStepVerification(value) {
    twoStepVerify = value;
    notifyListeners();
  }

  void goBack() {
    _navigation.popRepeated(1);
  }

  int blockedNum = 0;

  void navigateToBlocked() {
    //
  }

  final List privacyType = [
    ['Friends', false],
    ['Public', true],
    ['Me', false]
  ];
  String? privacyStatus = 'Public';

  void selectPrivacyType(int index) {
    if (index == 0) {
      log(0.toString());
      log(privacyStatus.toString());
      privacyType[index][1] = true;
      privacyType[1][1] = false;
      privacyType[2][1] = false;
      privacyStatus = privacyType[0][0];
    }
    if (index == 1) {
      privacyType[index][1] = true;
      privacyType[0][1] = false;
      privacyType[2][1] = false;
      privacyStatus = privacyType[1][0];
    }
    if (index == 2) {
      privacyType[index][1] = true;
      privacyType[0][1] = false;
      privacyType[1][1] = false;
      privacyStatus = privacyType[2][0];
    }
    notifyListeners();
  }

  void whoCanSeePoints(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data);
  }

  void whoCanSeeFriends() {
    //
  }
  void whoCanSeeContents() {
    //
  }
  void receiveConnectionRequest() {
    //
  }
  void whoCanMessageMe() {
    //
  }
  void whoCanSeeChallenges() {
    //
  }
  void whoCanSeeChoices() {
    //
  }
  void whoCanSeeSessions() {
    //
  }
  void whoCanSeeActivity() {
    //
  }
  void conductingSessionInvite() {
    //
  }
  void quizzesAndDebateInvite() {
    //
  }
  void interestInvites() {
    //
  }
  void sessionsInvite() {
    //
  }
  void institutionInvites() {
    //
  }
  void organizationInvites() {
    //
  }
}
