import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import 'package:pets/Service/api_service.dart';
import 'package:pets/Service/useridStore.dart';
import 'package:pets/common/app_bar.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:pets/sign_up/about_you.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:pets/app_states/phone_auth_state.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  OTPScreen({this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Timer _timer;
  int _start = 60;
  bool isTimeOver = false;
  bool isLoading = false;
  bool showErrorMessage = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            if (_start == 0) {
              isTimeOver = true;
            }
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context: context, name: "Phone Verification"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter your OTP code here",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  child: Consumer(
                    builder: (BuildContext context, watch, child) {
                      return OTPTextField(
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 20,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w800),
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) async {
                          setState(() {
                            isLoading = true;
                          });
                          print("Completed: " + pin);
                          var otpData = await context
                              .read(myNotifierProvider)
                              .verifyOtp(widget.phoneNumber, pin);
                          print("THE OTP IS   $otpData");
                          if (otpData["isValid"] == false) {
                            setState(() {
                              showErrorMessage = true;
                            });
                          } else {
                            setState(() {
                              // ApiService().userid.add(otpData);
                              SharedPref()
                                  .save("userData", otpData["userData"]);
                            });
                            print("userdata");
                            print(ApiService().userid);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AboutYouScreen(
                                          userdata: otpData["userData"],
                                        )));
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            showErrorMessage == true
                ? Text(
                    "Please Enter Correct OTP",
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
            isTimeOver == false
                ? Padding(
                    padding: const EdgeInsets.only(top: 29.0, left: 38),
                    child: Row(
                      children: [
                        Text(
                          "Resend Code In",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "  $_start",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 30),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 29.0, left: 38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Didn't you received any code?",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Text("Click",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isTimeOver = false;
                                        _start = 60;
                                      });
                                    },
                                    child: Text(
                                      "Resend",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            isLoading == true ? CircularProgressIndicator() : Container(),
          ],
        ),
      ),
    );
  }
}
