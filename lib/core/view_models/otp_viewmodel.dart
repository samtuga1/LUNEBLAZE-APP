import 'dart:async';
import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class OtpViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  int counter = 60;
  late Timer timer;

  // Otp values
  late String firstOtp;
  late String secondOtp;
  late String thrirdOtp;
  late String fouthOtp;
  late String fifthOtp;
  late String sixthOtp;
  String getOtp() {
    return firstOtp + secondOtp + thrirdOtp + fouthOtp + fifthOtp + sixthOtp;
  }

  // Countdown funtion
  void countDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      notifyListeners();
      if (counter == 0) {
        timer.cancel();
      }
    });
  }

  void verifyOtp() {}
  void resendOtp() {
    // Resend Otp
  }
}
