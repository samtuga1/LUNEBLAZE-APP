import 'package:luneblaze_app/UIs/views/blocked_users_view.dart';
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

  static List yes_or_no_option_types = [
    ['Yes', true],
    ['No ', false],
  ];
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

  String select_yes_or_no(index, statusType) {
    if (index == 0) {
      yes_or_no_option_types[0][1] = true;
      yes_or_no_option_types[1][1] = true;
      statusType = yes_or_no_option_types[0][0];
    }
    if (index == 1) {
      yes_or_no_option_types[1][1] = false;
      yes_or_no_option_types[0][1] = true;
      statusType = yes_or_no_option_types[1][0];
    }
    notifyListeners();
    return statusType;
  }

  static List privacyType = [
    ['Friends', false],
    ['Public', true],
    ['Me', false]
  ];

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

  String selectPrivacyType(int index, String statusType) {
    if (index == 0) {
      privacyType[index][1] = true;
      privacyType[1][1] = false;
      privacyType[2][1] = false;
      statusType = privacyType[0][0];
    }
    if (index == 1) {
      privacyType[index][1] = true;
      privacyType[0][1] = false;
      privacyType[2][1] = false;
      statusType = privacyType[1][0];
    }
    if (index == 2) {
      privacyType[index][1] = true;
      privacyType[0][1] = false;
      privacyType[1][1] = false;
      statusType = privacyType[2][0];
    }
    notifyListeners();
    return statusType;
  }

  void whoCanSeePoints(title) async {
    final response = await _dialogService.showCustomDialog(
        barrierDismissible: true,
        variant: DialogType.form,
        title: title,
        data: pointsPrivacyStatus,
        description: _pointsPrivacyStatus);
    _pointsPrivacyStatus =
        selectPrivacyType(response?.data, pointsPrivacyStatus);
  }

  void whoCanSeeFriends(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: friendsPrivacyStatus,
      title: title,
    );
    _friendsPrivacyStatus =
        selectPrivacyType(response!.data, friendsPrivacyStatus);
  }

  void whoCanSeeContents(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: contentsPrivacyStatus,
      title: title,
    );
    _contentsPrivacyStatus =
        selectPrivacyType(response?.data, contentsPrivacyStatus);
  }

  void receiveConnectionRequest(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: connectionRequestOption,
      barrierDismissible: true,
    );
    _connectionRequestOption =
        select_yes_or_no(response?.data, connectionRequestOption);
  }

  void whoCanMessageMe(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: messagePrivacyStatus,
      title: title,
    );
    _messagePrivacyStatus =
        selectPrivacyType(response?.data, messagePrivacyStatus);
  }

  void whoCanSeeChallenges(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: challengesPrivacyStatus,
      title: title,
    );
    _challengesPrivacyStatus =
        selectPrivacyType(response?.data, challengesPrivacyStatus);
  }

  void whoCanSeeChoices(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: choicesPrivacyStatus,
      title: title,
    );
    _choicesPrivacyStatus =
        selectPrivacyType(response?.data, choicesPrivacyStatus);
  }

  void whoCanSeeSessions(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: sessionsPrivacyStatus,
      title: title,
    );
    _sessionsPrivacyStatus =
        selectPrivacyType(response?.data, sessionsPrivacyStatus);
  }

  void whoCanSeeActivity(title) async {
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      data: activityPrivacyStatus,
      title: title,
    );
    _activityPrivacyStatus =
        selectPrivacyType(response!.data, activityPrivacyStatus);
  }

  void conductingSessionInvite(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: conductingSessionOption,
      barrierDismissible: true,
    );
    _conductingSessionOption =
        select_yes_or_no(response?.data, _conductingSessionOption);
  }

  void quizzesAndDebateInvite(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: quizzesAndDebatesOption,
      barrierDismissible: true,
    );
    _quizzesAndDebatesOption =
        select_yes_or_no(response?.data, _quizzesAndDebatesOption);
  }

  void interestInvites(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: interestsOption,
      barrierDismissible: true,
    );
    _interestsOption = select_yes_or_no(response?.data, _interestsOption);
  }

  void sessionsInvite(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: sessionsInvitationOption,
      barrierDismissible: true,
    );
    _sessionsInvitationOption =
        select_yes_or_no(response?.data, _sessionsInvitationOption);
  }

  void institutionInvites(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: insttutionsInvitationOption,
      barrierDismissible: true,
    );
    _insttutionsInvitationOption =
        select_yes_or_no(response?.data, _insttutionsInvitationOption);
  }

  void organizationInvites(String title) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.no_yes,
      title: title,
      data: organizationInvitationOption,
      barrierDismissible: true,
    );
    _organizationInvitationOption =
        select_yes_or_no(response?.data, _organizationInvitationOption);
  }
}
