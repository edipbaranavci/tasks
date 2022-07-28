import 'package:flutter/material.dart';

class CustomNavigator {
  static void navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
