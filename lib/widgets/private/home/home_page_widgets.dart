import 'package:flutter/material.dart';

class TabBarOptionText extends StatelessWidget {
  const TabBarOptionText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  final EdgeInsets _paddingVertical = const EdgeInsets.symmetric(vertical: 5);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _paddingVertical,
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
