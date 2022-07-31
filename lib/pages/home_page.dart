import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/screens/task_add_screen.dart';
import '../models/tasks_todo.dart';
import '../screens/left_drawer.dart';
import '../widgets/global/empty_task_message_widget.dart';
import '../widgets/private/home/floating_action_button.dart';
import '../widgets/global/tasks_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _constants = HomePageConstats();
  int _datasControlCounter(Box<TasksTodo> box) {
    int counter = 0;
    var val = box.values;
    for (var element in val) {
      if (element.isDone == false && element.isRecycle == false) {
        counter++;
      }
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomLeftDrawer(),
        appBar: AppBar(title: Text(_constants.pageTitle)),
        floatingActionButton: HomePageFloatingActionButton(
          title: _constants.fabTitle,
          widget: const TaskAddScreen(),
        ),
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
                      if (ref!.isDone == false && ref.isRecycle == false) {
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
                  icon: const Icon(Icons.add_task_rounded, size: 50),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
