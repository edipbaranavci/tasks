import 'package:flutter/material.dart';
import 'package:tasks/utils/custom_navigator.dart';

class HomePageFloatingActionButton extends StatelessWidget {
  const HomePageFloatingActionButton(
      {Key? key, required this.title, required this.widget})
      : super(key: key);

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => CustomNavigator.navigate(context, widget),
      child: Text(title),
    );
  }
}
