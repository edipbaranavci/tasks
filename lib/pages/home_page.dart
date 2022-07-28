import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/screens/task_add_screen.dart';
import '../models/tasks_todo.dart';
import '../screens/left_drawer.dart';
import '../widgets/global/floating_action_button.dart';
import '../widgets/global/list_tasks_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _constants = HomePageConstats();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomLeftDrawer(),
        appBar: AppBar(title: Text(_constants.screenTitle)),
        floatingActionButton: CustomFloatingActionButton(
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
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  TasksTodo? ref = box.getAt(index);
                  if (ref!.isRecycle == false && ref.isDone == false) {
                    return ListTasks(ref: ref, index: index);
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
