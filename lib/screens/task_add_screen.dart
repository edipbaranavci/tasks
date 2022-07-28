import 'package:flutter/material.dart';
import '../views/task_add_screen_view.dart';
import '../widgets/global/custom_form_field.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({Key? key}) : super(key: key);

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends TaskAddScreenView {
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
