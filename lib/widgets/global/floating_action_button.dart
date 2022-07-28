import 'package:flutter/material.dart';
import 'package:tasks/utils/custom_navigator.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {Key? key, required this.title, required this.widget})
      : super(key: key);

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => CustomNavigator.navigate(context, widget),
      style: TextButton.styleFrom(
        primary: Theme.of(context).cardColor,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(title),
    );
  }
}
