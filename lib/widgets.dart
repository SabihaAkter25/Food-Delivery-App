
import 'package:flutter/material.dart';
import 'dart:ui';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "metropolis"
    );
  }

  static TextStyle headTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: "metropolis"
    );
  }

  static TextStyle lightTextFeildStyle() {
    return TextStyle(
        color: Colors.black38,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: "metropolis"
    );
  }

  static TextStyle semiBoldTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: "metropolis"
    );
  }
}