import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/models/tasks_todo.dart';
import 'package:tasks/pages/home_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TasksTodoAdapter());
  await Hive.openBox<TasksTodo>(Constants.tasksBoxTitle);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
