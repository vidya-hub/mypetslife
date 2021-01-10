import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pets/DataModel/phone_auth_info_model.dart';
import 'package:pets/DataModel/user_info_model.dart';

class ApiService {
  List userid = [];
  Future<PhoneAuthInfoModel> postPhoneNumber(String phoneNumber) async {
    var url = "http://3.227.254.246:8080/api/otp/send";
    var response = await http.post(url, body: {"phone": phoneNumber});
    var jsonData = json.decode(response.body);
    var phoneAuthData = PhoneAuthInfoModel.fromJson(jsonData);
    return phoneAuthData;
  }

  Future<Map> verifyOtp(String phoneNumber, String otpNumber) async {
    bool isValid = false;
    var url = "http://3.227.254.246:8080/api/otp/verify";
    var response =
        await http.post(url, body: {"phone": phoneNumber, "otp": otpNumber});
    var jsonData = json.decode(response.body);
    var otpInfoData = UserInfoModel.fromJson(jsonData);
    print(jsonData);
    userid.add(jsonData);
    if (otpInfoData.phone != null) {
      // userid.add(jsonData);
      // print(userid);
      return {"isValid": true, "userData": jsonData};
      // return isValid = true;
    }
    return {"isValid": false};
    // return isValid = false;
  }

  // storeUserId(var jsondat) {
  //   // List
  // }

// Future<UserInfoModel> verifyOtp(String phoneNumber, String otpNumber) async {
//   bool isValid = false;
//   var url = "http://pet.ngrok.io/api/otp/verify";
//   var response =
//   await http.post(url, body: {"phone": phoneNumber, "otp": otpNumber});
//   var jsonData = json.decode(response.body);
//   var otpInfoData = UserInfoModel.fromJson(jsonData);
//   print("IIIIIIIIIIIIIIIIIIII $jsonData");
//
//   print("IIIIIIIIIIIIIIIIIIII ${otpInfoData.phone}");
//
//   return otpInfoData;
// }

  Future<Map> creatTask(String userId, String tasktype, List timeArray) async {
    var url = "http://3.227.254.246:8080/api/otp/createTasks";
    print(userId);
    var body = json.encode({
      "userID": userId.toString(),
      "taskType": tasktype,
      "timeArray": timeArray,
      "repeat": true,
      "status": true
    });
    print(body);
    var response = await http.post(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: body);
    var jsonData = json.decode(response.body);
    return jsonData;
  }

  Future getTasks(String userId) async {
    var url = "http://3.227.254.246:8080/api/otp/getTasks";
    var body = json.encode({
      "userID": userId.toString(),
    });
    var response = await http.post(url, body: body, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    // print(response.statusCode);
    var jsonData = json.decode(response.body);
    return jsonData;
  }
}
