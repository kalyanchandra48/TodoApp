import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_elred/models/todo_data.dart';
import 'package:todo_app_elred/services/firebase_service.dart';
import 'package:todo_app_elred/services/storage_hive.dart';

import '../../../services/global.dart';

class TodoViewModel extends ChangeNotifier {
  static TodoViewModel of(BuildContext context) =>
      context.read<TodoViewModel>();

  ValueNotifier<bool> stopShimmer = ValueNotifier(true);
  setStopShimmer(bool value) {
    stopShimmer.value = value;
  }

  ValueNotifier<bool> confirmSave = ValueNotifier(false);

  setConfirmSave(bool confirmation) {
    confirmSave.value = confirmation;
  }

  static saveTodo(TodoData todoData) {
    HiveStorage.saveTodosData(todoData);
    FirebaseService.saveTodoInDB(todoData);
  }

  static updateTodo(TodoData todoData) {
    HiveStorage.updateTodosData(todoData);
    FirebaseService.updateToDB(todoData);
  }

  static completedTodo(TodoData todoData) {
    HiveStorage.updateTodosData(todoData);
    FirebaseService.updateToDB(todoData);
  }

  static deleteTodo(TodoData todoData) {
    HiveStorage.deleteTodoData(todoData);
    FirebaseService.deleteTodoData(todoData);
  }

  static Future<List<TodoData>> getTodosData() async {
    final List<TodoData> data = Global.boxes[BOXNAME.TODO_BOX]!.keys
        .map(
          (e) => TodoData(
            name: Global.boxes[BOXNAME.TODO_BOX]!.get(e).name,
            description: Global.boxes[BOXNAME.TODO_BOX]!.get(e).description,
            id: Global.boxes[BOXNAME.TODO_BOX]!.get(e).id,
            date: Global.boxes[BOXNAME.TODO_BOX]!.get(e).date,
            category: Global.boxes[BOXNAME.TODO_BOX]!.get(e).category,
            createdAt: Global.boxes[BOXNAME.TODO_BOX]!.get(e).createdAt,
            completed: Global.boxes[BOXNAME.TODO_BOX]!.get(e).completed,
          ),
        )
        .toList();

    return data;
  }
}
