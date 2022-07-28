import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants.dart';
import '../models/tasks_todo.dart';
import '../widgets/global/list_tasks_widget.dart';

class CompletedTasksPage extends StatefulWidget {
  const CompletedTasksPage({Key? key}) : super(key: key);

  @override
  State<CompletedTasksPage> createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {
  final String _apptitle = 'Tamamlanan Görevler';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_apptitle)),
        body: ValueListenableBuilder(
          valueListenable:
              Hive.box<TasksTodo>(Constants.tasksBoxTitle).listenable(),
          builder: (context, Box<TasksTodo> box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text(Constants.emptyBoxTitle),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  TasksTodo? ref = box.getAt(index);
                  if (ref!.isDone == true && ref.isRecycle == false) {
                    return ListTasks(
                      ref: ref,
                      index: index,
                      isDone: ref.isDone,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
