import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:pets/Service/api_service.dart';
import 'package:pets/DataModel/phone_auth_info_model.dart';
import 'package:pets/DataModel/user_info_model.dart';

final myNotifierProvider = ChangeNotifierProvider<PhoneAuthState>((_) {
  return PhoneAuthState();
});

class PhoneAuthState extends ChangeNotifier {
  ApiService _apiService = ApiService();
  List userinfo = [];

  Future<PhoneAuthInfoModel> postPhoneNumber(String phoneNumber) {
    var data = _apiService.postPhoneNumber(phoneNumber);
    return data;
  }

  Future<Map> verifyOtp(String phoneNumber, String otpNumber) {
    var data = _apiService.verifyOtp(phoneNumber, otpNumber);
    data.then((value) {
      userinfo.add(data);
      // print("userdcsts");
    });
    // userinfo.add(data);
    print("userdcsts");
    print(userinfo);

    return data;
  }
}

class UserData extends ChangeNotifier {
  List valList = [];
  void storeuserdata(value) async {
    valList.add(value);
    print(valList);
    notifyListeners();
  }
}
