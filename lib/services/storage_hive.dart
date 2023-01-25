import 'package:todo_app_elred/models/todo_data.dart';
import 'package:todo_app_elred/models/user_details.dart';
import 'package:todo_app_elred/services/global.dart';

class HiveStorage {
  static saveUserDetails(UserDetails userDetails) async {
    await Global.boxes[BOXNAME.USER_DETAILS_BOX]
        ?.put('userdetails', userDetails);

    UserDetails storeddetails =
        await Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');
   
  }

  static saveTodosData(TodoData todoData) async {
    await Global.boxes[BOXNAME.TODO_BOX]?.put(todoData.id, todoData);
  }

  static updateTodosData(TodoData todoData) async {
    TodoData getTodoData =
        await Global.boxes[BOXNAME.TODO_BOX]?.get(todoData.id);
    await Global.boxes[BOXNAME.TODO_BOX]?.put(getTodoData.id, todoData);
  }

  static deleteTodoData(TodoData todoData) async {
    TodoData getTodoOne =
        await Global.boxes[BOXNAME.TODO_BOX]?.get(todoData.id);
    await Global.boxes[BOXNAME.TODO_BOX]?.delete(getTodoOne.id);
  }

  
}
