import 'package:contacts_service/contacts_service.dart';

class ContactModel {
  String name;

  ContactModel({this.name});
}

final List<ContactModel> contactList = [
  ContactModel(name: "Matthew Collins"),
  ContactModel(name: "Bianca Jackson"),
  ContactModel(name: "Sara Jordan"),
  ContactModel(name: "Kathy Watkins"),
  ContactModel(name: "Matthew Collins"),
  ContactModel(name: "Bianca Jackson"),
  ContactModel(name: "Sara Jordan"),
  ContactModel(name: "Kathy Watkins"),
  ContactModel(name: "Matthew Collins"),
  ContactModel(name: "Bianca Jackson"),
  ContactModel(name: "Sara Jordan"),
  ContactModel(name: "Kathy Watkins"),
  ContactModel(name: "Matthew Collins"),
  ContactModel(name: "Bianca Jackson"),
  ContactModel(name: "Sara Jordan"),
  ContactModel(name: "Kathy Watkins"),
];

class UserContactItem {
  String contactName;
  Item number;
  bool isSelected;
  String prefix;

  UserContactItem(
      {this.number, this.contactName, this.isSelected, this.prefix});
}
