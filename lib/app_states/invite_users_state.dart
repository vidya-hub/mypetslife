import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pets/DataModel/contact_list_model.dart';

final inviteProviderState = ChangeNotifierProvider<InviteUserState>((_) {
  return InviteUserState();
});

class InviteUserState extends ChangeNotifier {
  bool _isAllowed = false;
  List<UserContactItem> _userContactList = List<UserContactItem>();
  bool get isAllowed => _isAllowed;
  List<UserContactItem> get getUserContactList => _userContactList;

  allowPermission() async {
    if (await Permission.contacts.request().isGranted) {
      _isAllowed = await Permission.contacts.request().isGranted;
      getContacts();
      notifyListeners();
    }
  }

  Future<void> getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    contacts.forEach((contact) async {
      var phoneNumber = contact.phones.toList();
      if (phoneNumber.length != 0) {
        var userContact = UserContactItem(
          contactName: contact.displayName,
          number: phoneNumber[0],
          isSelected: false,
          prefix: contact.prefix
        );
        _userContactList.add(userContact);
        notifyListeners();
      } else {
        return null;
      }
    });
  }
}
