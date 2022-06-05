import 'dart:developer';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:luneblaze_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../UIs/widgets/setup_dialog_ui.dart';

class PrivacySettingViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool _twoStepVerify = false;
  bool get twoStepVerify => _twoStepVerify;

  void switchTwoStepVerification(value) {
    _twoStepVerify = value;
    notifyListeners();
  }

  void goBack() => _navigation.popRepeated(1);

  int blockedNum = 0;

  void navigateToBlocked() async {
    await _navigation.navigateTo(Routes.blockedUsersView);
  }

  String _connectionRequestOption = 'Yes';
  String get connectionRequestOption => _connectionRequestOption;
  String _conductingSessionOption = 'Yes';
  String get conductingSessionOption => _conductingSessionOption;
  String _quizzesAndDebatesOption = 'Yes';
  String get quizzesAndDebatesOption => _quizzesAndDebatesOption;
  String _interestsOption = 'Yes';
  String get interestsOption => _interestsOption;
  String _sessionsInvitationOption = 'Yes';
  String get sessionsInvitationOption => _sessionsInvitationOption;
  String _insttutionsInvitationOption = 'Yes';
  String get insttutionsInvitationOption => _insttutionsInvitationOption;
  String _organizationInvitationOption = 'Yes';
  String get organizationInvitationOption => _organizationInvitationOption;

  String _pointsPrivacyStatus = 'Public';
  String get pointsPrivacyStatus => _pointsPrivacyStatus;
  String _friendsPrivacyStatus = 'Public';
  String get friendsPrivacyStatus => _friendsPrivacyStatus;
  String _contentsPrivacyStatus = 'Public';
  String get contentsPrivacyStatus => _contentsPrivacyStatus;
  String _messagePrivacyStatus = 'Public';
  String get messagePrivacyStatus => _messagePrivacyStatus;
  String _challengesPrivacyStatus = 'Public';
  String get challengesPrivacyStatus => _challengesPrivacyStatus;
  String _choicesPrivacyStatus = 'Public';
  String get choicesPrivacyStatus => _choicesPrivacyStatus;
  String _sessionsPrivacyStatus = 'Public';
  String get sessionsPrivacyStatus => _sessionsPrivacyStatus;
  String _activityPrivacyStatus = 'Public';
  String get activityPrivacyStatus => _activityPrivacyStatus;

  void whoCanSeePoints(title) async {
    final response = await _dialogService.showCustomDialog(
        barrierDismissible: true,
        variant: DialogType.form,
        title: title,
        data: pointsPrivacyStatus,
        description: _pointsPrivacyStatus);
    _pointsPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeFriends(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: friendsPrivacyStatus,
      title: title,
    );
    _friendsPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeContents(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: contentsPrivacyStatus,
      title: title,
    );
    _contentsPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void receiveConnectionRequest(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: connectionRequestOption,
      barrierDismissible: true,
    );
    _connectionRequestOption = response!.data.toString();
    notifyListeners();
  }

  void whoCanMessageMe(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: messagePrivacyStatus,
      title: title,
    );
    _messagePrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeChallenges(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: challengesPrivacyStatus,
      title: title,
    );
    _challengesPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeChoices(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: choicesPrivacyStatus,
      title: title,
    );
    _choicesPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeSessions(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: sessionsPrivacyStatus,
      title: title,
    );
    _sessionsPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeActivity(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: activityPrivacyStatus,
      title: title,
    );
    _activityPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void conductingSessionInvite(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: conductingSessionOption,
      barrierDismissible: true,
    );
    _conductingSessionOption = response!.data.toString();
    notifyListeners();
  }

  void quizzesAndDebateInvite(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: quizzesAndDebatesOption,
      barrierDismissible: true,
    );
    _quizzesAndDebatesOption = response!.data.toString();
    notifyListeners();
  }

  void interestInvites(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: interestsOption,
      barrierDismissible: true,
    );
    _interestsOption = response!.data.toString();
    notifyListeners();
  }

  void sessionsInvite(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: sessionsInvitationOption,
      barrierDismissible: true,
    );
    _sessionsInvitationOption = response!.data.toString();
    notifyListeners();
  }

  void institutionInvites(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: insttutionsInvitationOption,
      barrierDismissible: true,
    );
    _insttutionsInvitationOption = response!.data.toString();
    notifyListeners();
  }

  void organizationInvites(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: organizationInvitationOption,
      barrierDismissible: true,
    );

    _organizationInvitationOption = response!.data.toString();
    notifyListeners();

    log(response.toString());
  }
}
