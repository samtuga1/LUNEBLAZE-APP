import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luneblaze_app/core/view_models/otp_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      onModelReady: (model) => model.countDown(),
      onDispose: (model) => model.timer.cancel(),
      viewModelBuilder: () => OtpViewModel(),
      builder: (context, model, _) => Scaffold(
        body: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // OTP VERIFICATION TEXT
                  Text(
                    'OTP VERICATION',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'A six confirmation code has been sent to your email, Please Verify It',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ROW OF OTP CONTAINERS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 58,
                        width: 58,
                        child: TextFormField(
                          showCursor: false,
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              model.firstOtp = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 58,
                        width: 58,
                        child: TextFormField(
                          showCursor: false,
                          onChanged: (value) {
                            if (value.length == 1) {
                              model.secondOtp = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 58,
                        width: 58,
                        child: TextFormField(
                          showCursor: false,
                          onChanged: (value) {
                            if (value.length == 1) {
                              model.thrirdOtp = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 58,
                        width: 58,
                        child: TextFormField(
                          showCursor: false,
                          onChanged: (value) {
                            if (value.length == 1) {
                              model.fouthOtp = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 58,
                        width: 58,
                        child: TextFormField(
                          showCursor: false,
                          onChanged: (value) {
                            if (value.length == 1) {
                              model.fifthOtp = value;
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 58,
                        width: 58,
                        child: TextFormField(
                          showCursor: false,
                          onChanged: (value) {
                            if (value.length == 1) {
                              model.sixthOtp = value;
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // BUTTON
                  GestureDetector(
                    onTap: () {
                      model.resendOtp();
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'RESEND OTP (${model.counter})',
                          style: TextStyle(color: Colors.white, fontSize: 16.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
