import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaskapp/modal/todo_modal.dart';

class TodoServices {

  final todoCollection =FirebaseFirestore.instance.collection('todoApp');

  // crud 
  void addTodoTask (TodoModal model){
    todoCollection.add(model.toMap());
  }

  void deleteTask(String docID){
    todoCollection.doc(docID).delete();
  }
  // create 
}