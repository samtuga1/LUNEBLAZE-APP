import 'dart:developer';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:luneblaze_app/app/app.router.dart';
import 'package:luneblaze_app/core/services/api_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../UIs/widgets/setup_dialog_ui.dart';

class PrivacySettingViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool loadingContents = false;

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

  // Fetch the initial data from server
  Future<void> fetch_initial_data() async {
    loadingContents = true;
    try {
      final response = await api_services.create().postPrivacyData({
        'user_id': '3',
        'target_id': '3',
      });
      if (response.body['status'] == 0 || response.body['data'] == null) {
        // We handle exceptions here is user is not logged in
        loadingContents = false;
        notifyListeners();
      } else {
        _pointsPrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _friendsPrivacyStatus =
            response.body['data']['profile']['user_privacy_friends'];
        _contentsPrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _messagePrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _challengesPrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _choicesPrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _sessionsPrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _activityPrivacyStatus =
            response.body['data']['profile']['user_privacy_points'];
        _connectionRequestOption =
            response.body['data']['profile']['privacy_connection_request'];
        _conductingSessionOption =
            response.body['data']['profile']['privacy_invite_conduct_session'];
        _quizzesAndDebatesOption =
            response.body['data']['profile']['privacy_challenges_invite'];
        _interestsOption =
            response.body['data']['profile']['privacy_invite_interest'];
        _sessionsInvitationOption =
            response.body['data']['profile']['privacy_invite_session'];
        _insttutionsInvitationOption =
            response.body['data']['profile']['privacy_invite_institution'];
        _organizationInvitationOption =
            response.body['data']['profile']['privacy_invite_organization'];
      }
      loadingContents = false;
      notifyListeners();
    } catch (error) {
      log(error.toString());
    }
  }

  void whoCanSeePoints(title) async {
    // This is showing dialog for points options
    final response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.form,
      title: title,
      data: pointsPrivacyStatus,
      description: _pointsPrivacyStatus,
    );
    _pointsPrivacyStatus = response!.data.toString();
    notifyListeners();
  }

  void whoCanSeeFriends(title) async {
    // This is showing dialog for who can see friends options
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
    // This is showing dialog for who can see contents options
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
    // This is showing dialog for recieve connections options
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
    // This is showing dialog for who can message me options
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
    // This is showing dialog for who can see challenges options
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
    // This is showing dialog for who can see choices options
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
    // This is showing dialog for who can see sessions options
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
    // This is showing dialog for who can see activity options
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
    // This is showing dialog for conducting session invite options
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
    // This is showing dialog for quizzues and debate invites options
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
    // This is showing dialog for interest options
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
    // This is showing dialog for session invites options
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
    // This is showing dialog for institutions invites options
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
    // This is showing dialog for organizing invites options
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
