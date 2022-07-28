import 'package:flutter/material.dart';

class LeftDrawerCardList extends StatelessWidget {
  const LeftDrawerCardList({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: icon,
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
