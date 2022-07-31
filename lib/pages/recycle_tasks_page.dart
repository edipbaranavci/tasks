import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants.dart';
import '../models/tasks_todo.dart';
import '../widgets/global/empty_task_message_widget.dart';
import '../widgets/global/tasks_list_card_widget.dart';

class RecyleTasksPage extends StatefulWidget {
  const RecyleTasksPage({Key? key}) : super(key: key);

  @override
  State<RecyleTasksPage> createState() => _RecyleTasksPageState();
}

class _RecyleTasksPageState extends State<RecyleTasksPage> {
  final _constants = ReyclePageConstants();

  int _datasControlCounter(Box<TasksTodo> box) {
    int counter = 0;
    var val = box.values;
    for (var element in val) {
      if (element.isRecycle == true) {
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
                      if (ref!.isRecycle == true) {
                        return TasksListCardWidget(
                          ref: ref,
                          index: index,
                          isDeleted: ref.isRecycle,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                );
              } else {
                return EmptyTaskMessageWidget(
                    emptyBoxTitle: _constants.emptyBoxTitle,
                    icon: const Icon(Icons.recycling_rounded, size: 50));
              }
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_constants.pageHintTitle),
        ),
      ),
    );
  }
}
