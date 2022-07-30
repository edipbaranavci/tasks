import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constants.dart';
import '../../models/tasks_todo.dart';
import '../../screens/task_update_screen.dart';
import '../../utils/custom_navigator.dart';
import '../private/list_task_widget/task_view_bottom_sheet.dart';

// ignore: must_be_immutable
class ListTasks extends StatelessWidget {
  ListTasks({
    Key? key,
    required this.ref,
    this.onChanged,
    required this.index,
    this.isDone,
    this.isDeleted,
  }) : super(key: key);

  bool? isDone;
  final bool? isDeleted;

  final TasksTodo? ref;
  final int index;
  final void Function(bool?)? onChanged;

  final Box<TasksTodo> _box = Hive.box<TasksTodo>(Constants.tasksBoxTitle);
  final _constants = ListTaskWidgetConstants();

  void changeTaskDone(BuildContext context) {
    final newBool = !ref!.isDone;
    final model = ref!.copyWith(isDone: newBool);
    _box.putAt(index, model);
    if (isDeleted != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newBool
                ? _constants.taskNotCompletedTitle
                : _constants.taskCompletedTitle,
          ),
        ),
      );
    }
  }

  void recycle(BuildContext context) {
    final model = ref!.copyWith(isRecycle: true);
    _box.putAt(index, model);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_constants.taskGoToRecyleTitle),
      ),
    );
  }

  void deleteItem(BuildContext context) {
    ref!.delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_constants.taskDeletedTitle),
      ),
    );
  }

  void restore(BuildContext context) {
    final model = ref!.copyWith(isRecycle: false);
    _box.putAt(index, model);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_constants.taskBackToRecyleTitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isDone = ref!.isDone == true ? true : isDone;
    final isDoneTextStyle = TextStyle(
      decoration:
          isDone == true ? TextDecoration.lineThrough : TextDecoration.none,
    );
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: (isDeleted == true || isDone == true)
          ? Theme.of(context).primaryColor.withOpacity(0.7)
          : Theme.of(context).primaryColorDark,
      child: Dismissible(
        direction: DismissDirection.startToEnd,
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
        onDismissed: (_) {
          if (isDeleted == true) {
            deleteItem(context);
          } else {
            recycle(context);
          }
        },
        child: ListTile(
          leading: IconButton(
            onPressed: () => changeTaskDone(context),
            icon: Icon(
              (isDone ?? false)
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => TaskViewBottomSheet(
                description: ref!.description,
                title: ref!.title,
                dateTime: ref!.dateTime,
              ),
            );
          },
          selected: (isDeleted == true || isDone == true) ? true : false,
          selectedColor: Colors.white38,
          trailing: (isDeleted != null && isDeleted == true)
              ? IconButton(
                  onPressed: () => restore(context),
                  icon: const Icon(Icons.restore_from_trash, size: 34),
                )
              : IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => CustomNavigator.navigate(
                      context, TaskUpdateScreen(tasksTodo: ref!, index: index)),
                ),
          title: Text(
            ref!.title,
            style: isDoneTextStyle,
          ),
          subtitle: Text(
            ref!.description,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: isDoneTextStyle,
          ),
        ),
      ),
    );
  }
}
