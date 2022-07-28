// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksTodoAdapter extends TypeAdapter<TasksTodo> {
  @override
  final int typeId = 0;

  @override
  TasksTodo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksTodo(
      dateTime: fields[4] as String,
      title: fields[0] as String,
      description: fields[1] as String,
      isDone: fields[2] as bool,
      isRecycle: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TasksTodo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.isDone)
      ..writeByte(3)
      ..write(obj.isRecycle)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksTodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
