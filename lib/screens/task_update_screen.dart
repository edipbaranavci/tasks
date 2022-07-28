import 'package:flutter/material.dart';
import 'package:tasks/models/tasks_todo.dart';
import '../views/task_update_screen_view.dart';
import '../widgets/global/custom_form_field.dart';

class TaskUpdateScreen extends StatefulWidget {
  const TaskUpdateScreen(
      {Key? key, required this.tasksTodo, required this.index})
      : super(key: key);
  final TasksTodo tasksTodo;
  final int index;

  @override
  State<TaskUpdateScreen> createState() => _TaskUpdateScreenState();
}

class _TaskUpdateScreenState extends TaskUpdateScreenView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CustomFormField(
              controller: titleEC,
              hintTex: constants.titleControllerHintText,
            ),
            CustomFormField(
              maxLines: 4,
              maxLength: 255,
              controller: descriptionEC,
              hintTex: constants.descControllerHintText,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: taskAdd,
              icon: const Icon(Icons.save),
              label: Text(constants.submitButtonTitle),
            ),
          ],
        ),
      ),
    );
  }
}
