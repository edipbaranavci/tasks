import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.hintTex,
    this.maxLines = 1,
    this.maxLength = 30,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintTex;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintTex,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
