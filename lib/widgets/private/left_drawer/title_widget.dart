import 'package:flutter/material.dart';

class LeftDrawerTitleWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  LeftDrawerTitleWidget({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
