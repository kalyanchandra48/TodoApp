import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_elred/models/todo_data.dart';
import 'package:todo_app_elred/models/user_details.dart';
import 'package:todo_app_elred/services/global.dart';

class FirebaseService {
  static saveTodoInDB(TodoData todoData) {
    UserDetails user =
        Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('users')
        .doc(user.useruid)
        .collection('todos')
        .doc(todoData.id)
        .set({
      'name': todoData.name,
      'description': todoData.description,
      'date': todoData.date,
      'category': todoData.category,
      'completed': todoData.completed,
      'createdAt': todoData.createdAt,
      'id': todoData.id,
    });
  }

  static updateToDB(TodoData todoData) {
    UserDetails user =
        Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('users')
        .doc(user.useruid)
        .collection('todos')
        .doc(todoData.id)
        .update({
      'name': todoData.name,
      'description': todoData.description,
      'date': todoData.date,
      'category': todoData.category,
      'completed': todoData.completed,
      'id': todoData.id,
    });
  }

  static deleteTodoData(TodoData todoData) {
    UserDetails user =
        Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('users')
        .doc(user.useruid)
        .collection('todos')
        .doc(todoData.id)
        .delete();
  }

  static getUserDBData() async {
    UserDetails user =
        Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');

    CollectionReference? collectionRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.useruid)
        .collection('todos');

    QuerySnapshot querySnapshot = await collectionRef.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      TodoData todoData = TodoData.fromMap(data);

      Global.boxes[BOXNAME.TODO_BOX]?.put(todoData.id, todoData);
    }
  }
}
