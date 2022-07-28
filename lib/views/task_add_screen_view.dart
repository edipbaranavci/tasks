import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../models/tasks_todo.dart';
import '../screens/task_add_screen.dart';
import '../widgets/global/empty_alert_dialog.dart';

abstract class TaskAddScreenView extends State<TaskAddScreen> {
  final constants = TasksAddScreenConstants();

  TextEditingController titleEC = TextEditingController();
  TextEditingController descriptionEC = TextEditingController();

  void taskAdd() {
    if (titleEC.text.isNotEmpty && descriptionEC.text.isNotEmpty) {
      var a = DateTime.now();
      var date = '${a.day}.${a.month}.${a.year}';
      var time = '${a.hour}:${a.minute}';
      String dateTime = '$date $time';
      final model = TasksTodo(
          title: titleEC.text,
          isDone: false,
          description: descriptionEC.text,
          dateTime: dateTime);
      Box<TasksTodo> box = Hive.box<TasksTodo>(Constants.tasksBoxTitle);
      box.add(model);
      Navigator.of(context).pop();
    } else {
      showDialog(
        context: context,
        builder: (context) => EptyAlertDialog(
          emptyAlertTitle: constants.emptyAlertTitle,
          okButtonTitle: constants.okButtonTitle,
        ),
      );
    }
  }
}
