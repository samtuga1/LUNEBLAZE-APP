import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PrivacySettingViewModel extends BaseViewModel {
  bool twoStepVerify = false;
  void switchTwoStepVerification(value) {
    twoStepVerify = value;
    notifyListeners();
  }

  String? pointStatus;

  int blockedNum = 0;

  void navigateToBlocked() {
    //
  }

  final List privacyType = [
    ['Friends', true],
    ['Public', false],
    ['Me', false]
  ];

  void selectPrivacyType(int index) {
    privacyType[index][1] = true;
  }

  void whoCanSeePoints(title, context) {
    showDialog(
      context: context,
      builder: (ctx) => ShowAlertBox(
        title: title,
        onTap: () {},
        isSelected: true,
      ),
    );
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

class ShowAlertBox extends StatelessWidget {
  const ShowAlertBox(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          title,
          style: TextStyle(fontSize: 16.5),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            // This generates the Radio buttons which is selectable
            PrivacySettingViewModel().privacyType.length,
            (index) => Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(children: [
                Text(PrivacySettingViewModel().privacyType[index][0]),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    PrivacySettingViewModel().selectPrivacyType(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        child: PrivacySettingViewModel().privacyType[index][1]
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                        decoration: BoxDecoration(
                          color: PrivacySettingViewModel().privacyType[index][1]
                              ? Colors.green
                              : null,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ).toList(),
        ));
  }
}
