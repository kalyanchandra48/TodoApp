import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_elred/models/todo_data.dart';
import 'package:todo_app_elred/models/user_details.dart';


class HiveInstance {
  static late Box _userdetails;
 
  static late Box _tododata;

  static initialiseHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDetailsAdapter());
   
    Hive.registerAdapter(TodoDataAdapter());

    _userdetails = await Hive.openBox('user_details');
   
    _tododata = await Hive.openBox('todo_data');
  }

  static Box get userdetails {
    return _userdetails;
  }

  

  static Box get tododata {
    return _tododata;
  }

  static clearHive() {
    HiveInstance.userdetails.clear();
    HiveInstance.tododata.clear();

  }
}
