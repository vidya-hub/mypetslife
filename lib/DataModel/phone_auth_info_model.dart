class PhoneAuthInfoModel {
  String phone;
  String otp;
  String createdAt;
  String updatedAt;

  PhoneAuthInfoModel({this.phone, this.otp, this.createdAt, this.updatedAt});

  PhoneAuthInfoModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    otp = json['otp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
