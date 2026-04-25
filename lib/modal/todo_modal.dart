// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModal {
  String? docId;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;
  final bool isDone;

  TodoModal({
     this.docId, required this.titleTask, required this.description, required this.category, required this.dateTask, required this.timeTask, required this.isDone
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titleTask': titleTask,
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone':isDone,
    };
  }

  factory TodoModal.fromMap(Map<String, dynamic> map) {
    return TodoModal(
      docId: map['docId'] as String,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone :  map['isDone'] as bool,
    );
  }

  factory TodoModal.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> doc){
    return TodoModal(docId: doc.id, titleTask:doc['titleTask'] , description: doc['description'], category: doc['category'], dateTask: doc['dateTask'], timeTask: doc['timeTask'],isDone: doc['isDone']);
  }
}
