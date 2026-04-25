import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mytaskapp/modal/todo_modal.dart';
import 'package:mytaskapp/services/todo_services.dart';

final serviceProvider =StateProvider<TodoServices>((ref){
  return TodoServices();
} );

  final fetchStreamProvider = StreamProvider<List<TodoModal>>((ref) {
    final getData = FirebaseFirestore.instance.collection('todoApp').snapshots().map( (event) =>event.docs.map((snapshot) => TodoModal.fromSnapshot(snapshot)).toList());
    return getData;
  } );

   final todoCollection =
      FirebaseFirestore.instance.collection('todoApp');

 