import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var current = 2;

Widget indicatorSlide() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2, left: 2),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == 2 ? Colors.grey : Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == 2 ? Colors.black : Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 2, left: 2),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == 2 ? Colors.grey : Colors.black),
          ),
        ),
      ],
    ),
  );
}
