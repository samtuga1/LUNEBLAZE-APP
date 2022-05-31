import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/global_appbar.dart';
import 'package:luneblaze_app/core/view_models/privacy_settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PrivacySettingsView extends StatelessWidget {
  const PrivacySettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrivacySettingViewModel>.reactive(
      viewModelBuilder: () => PrivacySettingViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: GlobalAppBar(title: 'PRIVACY SETTINGS'),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              PrivacySettingsTile(
                title: 'Who can see your points?',
                onTap: () =>
                    model.whoCanSeePoints('Who can see your points?', context),
                subtitle: model.pointStatus,
              ),
              PrivacySettingsTile(
                title: 'Who can see your friends',
                onTap: model.whoCanSeeFriends,
              ),
              PrivacySettingsTile(
                  title: 'Who can see your contents',
                  onTap: model.whoCanSeeContents),
              PrivacySettingsTile(
                title: 'Do you want to receive connection request?',
                onTap: model.receiveConnectionRequest,
              ),
              PrivacySettingsTile(
                  title: 'Who can Message you?', onTap: model.whoCanMessageMe),
              PrivacySettingsTile(
                  title: 'Who can see your challenges?',
                  onTap: model.whoCanSeeChallenges),
              PrivacySettingsTile(
                  title: 'Who can see your choices?',
                  onTap: model.whoCanSeeChoices),
              PrivacySettingsTile(
                  title: 'Who can see your sessions?',
                  onTap: model.whoCanSeeSessions),
              PrivacySettingsTile(
                  title: 'Who can see your activity?',
                  onTap: model.whoCanSeeActivity),
              PrivacySettingsTile(
                  title: 'Do you want to get invited for conducting session?',
                  onTap: model.conductingSessionInvite),
              PrivacySettingsTile(
                  title: 'Do you want to get invited for Quizzes & Debates?',
                  onTap: model.quizzesAndDebateInvite),
              PrivacySettingsTile(
                  title: 'Do you want to get invited for interests?',
                  onTap: model.interestInvites),
              PrivacySettingsTile(
                  title: 'Do you want to get invited for Sessions?',
                  onTap: model.sessionsInvite),
              PrivacySettingsTile(
                  title: 'Do you want to get invited for Institutions?',
                  onTap: model.institutionInvites),
              PrivacySettingsTile(
                title: 'Do you want to get invited for Organisations?',
                onTap: model.organizationInvites,
              ),
              Divider(
                thickness: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 12, bottom: 12, right: 7),
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
  const PrivacySettingsTile({
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
      child: Padding(
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
