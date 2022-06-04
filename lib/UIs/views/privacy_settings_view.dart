import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../core/services/view_models/privacy_settings_viewmodel.dart';

class PrivacySettingsView extends StatelessWidget {
  const PrivacySettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrivacySettingViewModel>.reactive(
      viewModelBuilder: () => PrivacySettingViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: GlobalAppBar(
            title: 'PRIVACY SETTINGS',
            onTap: model.goBack,
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              PrivacySettingsTile(
                title: 'Who can see your points?',
                onTap: () {
                  model.whoCanSeePoints('Who can see your points?');
                },
                subtitle: model.pointsPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your friends',
                onTap: () {
                  model.whoCanSeeFriends('Who can see your friends');
                },
                subtitle: model.friendsPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your contents',
                onTap: () {
                  model.whoCanSeeContents('Who can see your contents');
                },
                subtitle: model.contentsPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Do you want to receive connection request?',
                onTap: () {
                  model.receiveConnectionRequest(
                      'Do you want to recieve connection request?');
                },
                subtitle: model.connectionRequestOption,
              ),
              PrivacySettingsTile(
                title: 'Who can Message you?',
                onTap: () {
                  model.whoCanMessageMe('Who can Message you?');
                },
                subtitle: model.messagePrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your challenges?',
                onTap: () {
                  model.whoCanSeeChallenges('Who can see your challenges?');
                },
                subtitle: model.challengesPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your choices?',
                onTap: () {
                  model.whoCanSeeChoices('Who can see your choices?2');
                },
                subtitle: model.choicesPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your sessions?',
                onTap: () {
                  model.whoCanSeeSessions('Who can see your sessions?');
                },
                subtitle: model.sessionsPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your activity?',
                onTap: () {
                  model.whoCanSeeActivity('Who can see your activity?');
                },
                subtitle: model.activityPrivacyStatus,
              ),
              PrivacySettingsTile(
                title: 'Do you want to get invited for conducting session?',
                onTap: () {
                  model.conductingSessionInvite(
                      'Do you want to get invited for conducting session?');
                },
                subtitle: model.conductingSessionOption,
              ),
              PrivacySettingsTile(
                title: 'Do you want to get invited for Quizzes & Debates?',
                onTap: () {
                  model.quizzesAndDebateInvite(
                      'Do you want to get invited for Quizzes & Debates?');
                },
                subtitle: model.quizzesAndDebatesOption,
              ),
              PrivacySettingsTile(
                title: 'Do you want to get invited for interests?',
                onTap: () {
                  model.interestInvites(
                      'Do you want to get invited for interests?');
                },
                subtitle: model.interestsOption,
              ),
              PrivacySettingsTile(
                title: 'Do you want to get invited for Sessions?',
                onTap: () {
                  model.sessionsInvite(
                      'Do you want to get invited for Sessions?');
                },
                subtitle: model.sessionsInvitationOption,
              ),
              PrivacySettingsTile(
                title: 'Do you want to get invited for Institutions?',
                onTap: () {
                  model.institutionInvites(
                      'Do you want to get invited for Institutions?');
                },
                subtitle: model.insttutionsInvitationOption,
              ),
              PrivacySettingsTile(
                title: 'Do you want to get invited for Organisations?',
                onTap: () {
                  model.organizationInvites(
                      'Do you want to get invited for Organisations?');
                },
                subtitle: model.organizationInvitationOption,
              ),
              Divider(
                thickness: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 12, bottom: 12, right: 7),
                child: GestureDetector(
                  onTap: model.navigateToBlocked,
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Blocked(${model.blockedNum})',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Two-step verification',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Switch(
                    activeColor: Colors.teal,
                    value: model.twoStepVerify,
                    onChanged: (value) =>
                        model.switchTwoStepVerification(value),
                  ),
                ],
              )
            ]),
          )),
    );
  }
}

class PrivacySettingsTile extends StatelessWidget {
  PrivacySettingsTile({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle ?? '',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
