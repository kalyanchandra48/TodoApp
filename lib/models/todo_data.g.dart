// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDataAdapter extends TypeAdapter<TodoData> {
  @override
  final int typeId = 2;

  @override
  TodoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoData(
      id: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as String,
      date: fields[5] as String,
      createdAt: fields[6] as String,
      completed: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoData obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
