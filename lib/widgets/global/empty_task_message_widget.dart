import 'package:flutter/material.dart';

class EmptyTaskMessageWidget extends StatelessWidget {
  const EmptyTaskMessageWidget({
    Key? key,
    required String emptyBoxTitle,
    required this.icon,
  })  : _emptyBoxTitle = emptyBoxTitle,
        super(key: key);

  final String _emptyBoxTitle;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(_emptyBoxTitle),
          )
        ],
      ),
    );
  }
}
