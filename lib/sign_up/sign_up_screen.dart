import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:pets/common/gradientButton.dart';
import 'package:pets/common/phone_number.dart';
import 'package:pets/sign_up/otp_screen.dart';
import 'package:pets/app_states/phone_auth_state.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'dart:async';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pets/app_states/device_location_detector_state.dart';
import 'package:pets/common/country_list_d.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  String countryCode = "91";
  String fullNumber;
  bool isLoading = false;

  @override
  void initState() {
    int index = countryList.indexWhere((element) => element.isoCode == 'SO');
    print("${countryList.elementAt(index).phoneCode}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 68.0, left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 29,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.7),
                  ),
                ),
                Text(
                  "Register For Free",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                  child: Text(
                    "Mobile",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Color(0xffF0F0F0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        children: <Widget>[
                          Consumer(
                            builder: (BuildContext context, watch, child) {
                              final locationProvider =
                                  watch(deviceLocationProvider)
                                      .getPhoneCountryCode;
                              defaultPhoneCode(locationProvider);
                              countryCode = defaultPhoneCode(locationProvider);

                              return locationProvider != null
                                  ? CountryPickerDropdown(
                                      initialValue: locationProvider,
                                      itemBuilder: _buildDropdownItem,
                                      onValuePicked: (Country country) {
                                        print("${country.phoneCode}");
                                        setState(() {
                                          countryCode = country.phoneCode;
                                        });
                                      },
                                    )
                                  : CircularProgressIndicator();
                            },
                          ),
                          Expanded(
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.cancel),
                                border: InputBorder.none,
                                hintText: "Phone Number",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isLoading == true ? CircularProgressIndicator() : Container(),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.only(left: 142.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
                child: Consumer(
                  builder: (BuildContext context, watch, child) {
                    final phoneAuthProvider = watch(myNotifierProvider);
                    return RaisedGradientButton(
                        child: Text(
                          'GET OTP          ➜ ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xffcac8cf),
                            const Color(0xffcac8cf)
                          ],
                        ),
                        onPressed: () async {
                          print(_phoneNumberController.text == "");
                          if (_phoneNumberController.text != "") {
                            setState(() {
                              isLoading = true;
                            });
                            fullNumber =
                                "+" + countryCode + _phoneNumberController.text;
                            var phoneAuthData = await context
                                .read(myNotifierProvider)
                                .postPhoneNumber(fullNumber);

                            print("PHONE ${_phoneNumberController.text}");
                            print("OTP ${phoneAuthData.otp}");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OTPScreen(
                                          phoneNumber: fullNumber,
                                        )));
                          }
                        });
                  },
                ),
              ),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Need Help?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Send email to  ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: '"support@mypets.us"',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => Container(
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Text("+${country.phoneCode}"),
        ],
      ),
    );
