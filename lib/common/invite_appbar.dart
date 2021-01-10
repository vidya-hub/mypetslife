import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget inviteAppbar({var selectedLength}) {
  return AppBar(
    leading: Icon(Icons.arrow_back),
    elevation: 1,
    backgroundColor: Colors.grey,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Oreo's caretaker Group "),
        selectedLength.length == 0
            ? Text(
                "Add Participants",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              )
            : Text(
                "${selectedLength.length.toString()} Selected",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Icon(Icons.search),
      )
    ],
  );
}
