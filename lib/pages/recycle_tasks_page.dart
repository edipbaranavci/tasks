import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants.dart';
import '../models/tasks_todo.dart';
import '../widgets/global/list_tasks_widget.dart';

class RecyleTasksPage extends StatefulWidget {
  const RecyleTasksPage({Key? key}) : super(key: key);

  @override
  State<RecyleTasksPage> createState() => _RecyleTasksPageState();
}

class _RecyleTasksPageState extends State<RecyleTasksPage> {
  final String _appTitle = 'Geri Dönüşüm Kutusu';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_appTitle)),
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
                  if (ref!.isRecycle == true) {
                    return ListTasks(
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
          },
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Görevleri kalıcı olarak silmek için sağa kaydırın'),
        ),
      ),
    );
  }
}
