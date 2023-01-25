import 'dart:convert';

import 'package:hive/hive.dart';

part 'todo_data.g.dart';

@HiveType(typeId: 2)
class TodoData {
  @HiveField(1)
  String id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String description;
  @HiveField(4)
  String category;
  @HiveField(5)
  String date;
  @HiveField(6)
  String createdAt;
  @HiveField(7)
  bool completed;
  TodoData({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.date,
    required this.createdAt,
    required this.completed,
  });

  TodoData copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? date,
    String? createdAt,
    bool? completed,
  }) {
    return TodoData(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'category': category});
    result.addAll({'date': date});
    result.addAll({'createdAt': createdAt});
    result.addAll({'completed': completed});
  
    return result;
  }

  factory TodoData.fromMap(Map<String, dynamic> map) {
    return TodoData(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      date: map['date'] ?? '',
      createdAt: map['createdAt'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoData.fromJson(String source) =>
      TodoData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodoData(id: $id, name: $name, description: $description, category: $category, date: $date, createdAt: $createdAt, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TodoData &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.category == category &&
      other.date == date &&
      other.createdAt == createdAt &&
      other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      category.hashCode ^
      date.hashCode ^
      createdAt.hashCode ^
      completed.hashCode;
  }
}

enum TodoCategory {
  business('BUSINESS'),
  personal('PERSONAL');

  const TodoCategory(this.value);

  final String value;
}
