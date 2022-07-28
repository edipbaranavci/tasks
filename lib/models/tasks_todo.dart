// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'tasks_todo.g.dart';

@HiveType(typeId: 0)
class TasksTodo extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isDone;

  @HiveField(3)
  final bool isRecycle;

  @HiveField(4)
  final String dateTime;

  TasksTodo({
    required this.dateTime,
    required this.title,
    required this.description,
    this.isDone = false,
    this.isRecycle = false,
  });

  TasksTodo copyWith({
    String? title,
    String? description,
    bool? isDone,
    bool? isRecycle,
    String? dateTime,
  }) {
    return TasksTodo(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isRecycle: isRecycle ?? this.isRecycle,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
