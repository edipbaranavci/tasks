import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/widgets/global/empty_task_message_widget.dart';
import '../constants.dart';
import '../models/tasks_todo.dart';
import '../widgets/global/tasks_list_card_widget.dart';

class CompletedTasksPage extends StatefulWidget {
  const CompletedTasksPage({Key? key}) : super(key: key);

  @override
  State<CompletedTasksPage> createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {
  final _constants = CompletedPageConstants();

  int _datasControlCounter(Box<TasksTodo> box) {
    int counter = 0;
    var val = box.values;
    for (var element in val) {
      if (element.isDone == true && element.isRecycle == false) {
        counter++;
      }
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_constants.pageTitle)),
        body: ValueListenableBuilder(
          valueListenable:
              Hive.box<TasksTodo>(Constants.tasksBoxTitle).listenable(),
          builder: (context, Box<TasksTodo> box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text(Constants.emptyBoxTitle),
              );
            } else {
              if (_datasControlCounter(box) > 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      TasksTodo? ref = box.getAt(index);
                      if (ref!.isDone == true && ref.isRecycle == false) {
                        return TasksListCardWidget(
                          ref: ref,
                          index: index,
                          isDone: ref.isDone,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                );
              } else {
                return EmptyTaskMessageWidget(
                  emptyBoxTitle: _constants.emptyBoxTitle,
                  icon: const Icon(Icons.done_all_rounded, size: 50),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
