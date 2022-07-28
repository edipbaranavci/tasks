import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../models/tasks_todo.dart';
import '../screens/task_update_screen.dart';
import '../widgets/global/empty_alert_dialog.dart';

abstract class TaskUpdateScreenView extends State<TaskUpdateScreen> {
  final constants = TasksAddScreenConstants();

  TextEditingController titleEC = TextEditingController();
  TextEditingController descriptionEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleEC.text = widget.tasksTodo.title;
    descriptionEC.text = widget.tasksTodo.description;
  }

  void taskAdd() {
    if (titleEC.text.isNotEmpty && descriptionEC.text.isNotEmpty) {
      final model = TasksTodo(
        title: titleEC.text,
        isDone: false,
        description: descriptionEC.text,
        dateTime: widget.tasksTodo.dateTime,
      );
      Box<TasksTodo> box = Hive.box<TasksTodo>(Constants.tasksBoxTitle);
      box.putAt(widget.index, model);
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
