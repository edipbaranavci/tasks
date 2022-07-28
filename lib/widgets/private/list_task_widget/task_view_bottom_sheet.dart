import 'package:flutter/material.dart';

class TaskViewBottomSheet extends StatelessWidget {
  const TaskViewBottomSheet({
    Key? key,
    required this.title,
    required this.description,
    required this.dateTime,
  }) : super(key: key);

  final String title;
  final String description;
  final String dateTime;

  final _dateTimePadding = const EdgeInsets.only(right: 10.0);
  final _descriptionPadding = const EdgeInsets.all(8.0);
  final _scrollBarRadius = const Radius.circular(5);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      builder: (context, scrollController) {
        return Scrollbar(
          trackVisibility: true,
          radius: _scrollBarRadius,
          thickness: 6,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(title),
                actions: [
                  Center(
                      child: Padding(
                    padding: _dateTimePadding,
                    child: Text(dateTime),
                  ))
                ],
              ),
              Padding(
                padding: _descriptionPadding,
                child: SelectableText(description),
              )
            ],
          ),
        );
      },
    );
  }
}
