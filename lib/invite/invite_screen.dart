import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:pets/DataModel/contact_list_model.dart';
import 'package:pets/app_states/invite_users_state.dart';
import 'package:pets/common/invite_appbar.dart';
import 'package:flutter_sms/flutter_sms.dart';

class InviteScreen extends StatefulWidget {
  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  List<UserContactItem> selectedContacts = [];
  List<String> selectedStringContacts = [];

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  @override
  void initState() {
    super.initState();
    context.read(inviteProviderState).allowPermission();
  }

  String messageBody =
      "Let us manage your pets's chores and make it fun.\n Invite your friends and family to My Pets Life \n by coupoun code : MPL0270887";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: inviteAppbar(selectedLength: selectedContacts),
        body: Consumer(
          builder: (BuildContext context, watch, child) {
            // final isAllowedProvider = watch(inviteProviderState).isAllowed;
            final contactListProvider =
                watch(inviteProviderState).getUserContactList;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 80,
                    child: selectedContacts.length == 0
                        ? Center(
                            child: Text("No Contacts Selected",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontSize: 16)))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: selectedContacts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ContactTile(
                                name: selectedContacts[index].contactName,
                              );
                            }),
                  ),
                  Container(
                    height: 400,
                    child: contactListProvider.length == 0
                        ? Center(
                            child: Text("Contacts \n Loading.....",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: contactListProvider.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    contactListProvider[index].isSelected =
                                        !contactListProvider[index].isSelected;
                                    if (selectedContacts
                                        .contains(contactListProvider[index])) {
                                      selectedContacts
                                          .remove(contactListProvider[index]);
                                      selectedStringContacts.remove(
                                          contactListProvider[index]
                                              .number
                                              .value);
                                    } else {
                                      selectedContacts
                                          .add(contactListProvider[index]);
                                      selectedStringContacts.add(
                                          contactListProvider[index]
                                              .number
                                              .value);
                                    }

                                    print(
                                        "LENGTH IS: ${selectedContacts.length}");
                                  });
                                },
                                child: ContactTile(
                                  name: contactListProvider[index].contactName,
                                  isSelected:
                                      contactListProvider[index].isSelected,
                                ),
                              );
                            }),
                  ),
                  Container(
                    height: 180,
                    color: Color(0xffF6F9FE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 28.0, right: 28, top: 28),
                          child: Text(
                              "Invite your friends and family to My Pets Life"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            children: [
                              Text("Copy your code and share"),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  "MPL0270887",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            onPressed: () {
                              _sendSMS(messageBody, selectedStringContacts);
                              print("hello");
                            },
                            child: Text("Invite"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: shareButtons(Icons.photo, "WhatsApp"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: shareButtons(Icons.copy, "Copy Link"),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        child: TextField(
                          decoration: inputDecoration(hintName: "search"),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 9),
                    child: Text(
                      "Phone Contacts",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  // ListView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     itemCount: contactListProvider.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return ContactTile(
                  //         name: contactListProvider[index].contactName,
                  //       );
                  //     }),
                ],
              ),
            );
          },
        ));
  }

  Widget shareButtons(IconData icon, String name) {
    return Column(
      children: [Icon(icon), Text(name)],
    );
  }

  InputDecoration inputDecoration({String hintName}) {
    return InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(5),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: Colors.grey)),
        border: OutlineInputBorder(),
        hintText: hintName,
        hintStyle: TextStyle(color: Colors.grey));
  }
}

Widget notInvitedWidgets(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Consumer(
        builder: (BuildContext context, watch, child) {
          final inviteProvider = watch(inviteProviderState);
          return Padding(
            padding: const EdgeInsets.only(top: 78.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  context.read(inviteProviderState).allowPermission();
                },
                child: Text(
                  "Select from the contacts",
                  style: TextStyle(
                      color: Color(0xff080040),
                      fontSize: 19,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          );
        },
      ),
      Container(
        height: 180,
        color: Color(0xffF6F9FE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28, top: 28),
              child: Text("Invite your friends and family to My Pets Life"),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                children: [
                  Text("Copy your code and share"),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "MPL0270887",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {},
                child: Text("Invite"),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

class ContactTile extends StatelessWidget {
  final String name;
  bool isSelected;

  ContactTile({this.name, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            height: 40,
            width: 40,
            child: Center(
                child: Text(
              name.substring(0, 2),
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Text(
          name,
          style:
              TextStyle(color: isSelected == true ? Colors.black : Colors.grey),
        )
      ],
    );
  }
}
