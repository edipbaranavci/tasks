import 'package:flutter/material.dart';

class EptyAlertDialog extends StatelessWidget {
  const EptyAlertDialog({
    Key? key,
    required this.emptyAlertTitle,
    required this.okButtonTitle,
  }) : super(key: key);

  final String emptyAlertTitle;
  final String okButtonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(emptyAlertTitle),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(okButtonTitle),
          ),
        ),
      ],
    );
  }
}
