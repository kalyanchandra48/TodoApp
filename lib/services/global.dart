import 'package:hive/hive.dart';
import 'package:todo_app_elred/services/hive.dart';

class Global {
  static final Map<BOXNAME, Box> boxes = {
    BOXNAME.USER_DETAILS_BOX: HiveInstance.userdetails,
    BOXNAME.TODO_BOX: HiveInstance.tododata,
  };
}

enum BOXNAME {
  USER_DETAILS_BOX,

  TODO_BOX,
}
