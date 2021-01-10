import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarWidget({BuildContext context ,String name}) {
  return AppBar(
    title: Text(
      name,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}
