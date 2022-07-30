import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasks/config/theme_settings.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/models/tasks_todo.dart';
import 'package:tasks/pages/home_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TasksTodoAdapter());
  await Hive.openBox<TasksTodo>(Constants.tasksBoxTitle);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeSettings()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeSettings>(context).getThemeData,
      themeMode: Provider.of<ThemeSettings>(context).getThemeMode,
      darkTheme: Provider.of<ThemeSettings>(context).getDarkThemeData,
      home: const HomePage(),
    );
  }
}
