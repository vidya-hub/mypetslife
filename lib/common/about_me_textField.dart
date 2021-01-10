import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget aboutMeTextField({TextEditingController controller, String header}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, top: 27),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: TextField(
            controller: controller,
          ),
        )
      ],
    ),
  );
}
