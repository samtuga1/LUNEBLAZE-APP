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
  String pointsPrivacyStatus = 'Public';
  String friendsPrivacyStatus = 'Public';
  String contentsPrivacyStatus = 'Public';
  String messagePrivacyStatus = 'Public';
  String challengesPrivacyStatus = 'Public';
  String choicesPrivacyStatus = 'Public';
  String sessionsPrivacyStatus = 'Public';
  String activityPrivacyStatus = 'Public';

  void selectPrivacyType(int index, String statusType) {
    if (index == 0) {
      privacyType[index][1] = true;
      privacyType[1][1] = false;
      privacyType[2][1] = false;
      statusType = privacyType[0][0];
      log(statusType.toString());
    }
    if (index == 1) {
      privacyType[index][1] = true;
      privacyType[0][1] = false;
      privacyType[2][1] = false;
      statusType = privacyType[1][0];
      log(statusType.toString());
    }
    if (index == 2) {
      privacyType[index][1] = true;
      privacyType[0][1] = false;
      privacyType[1][1] = false;
      statusType = privacyType[2][0];
      log(statusType.toString());
    }
    notifyListeners();
  }

  void whoCanSeePoints(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log('----------${response!.data.toString()}-------------');
    selectPrivacyType(response.data, pointsPrivacyStatus);
  }

  void whoCanSeeFriends(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, friendsPrivacyStatus);
  }

  void whoCanSeeContents(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, contentsPrivacyStatus);
  }

  void receiveConnectionRequest() {
    // final response = await _dialogService.showCustomDialog(
    //   barrierDismissible: true,
    //   variant: DialogType.form,
    //   title: title,
    // );
    // log(response!.data.toString());
    // selectPrivacyType(response.data);
  }
  void whoCanMessageMe(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, messagePrivacyStatus);
  }

  void whoCanSeeChallenges(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, challengesPrivacyStatus);
  }

  void whoCanSeeChoices(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, choicesPrivacyStatus);
  }

  void whoCanSeeSessions(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, sessionsPrivacyStatus);
  }

  void whoCanSeeActivity(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
    );
    log(response!.data.toString());
    selectPrivacyType(response.data, activityPrivacyStatus);
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
