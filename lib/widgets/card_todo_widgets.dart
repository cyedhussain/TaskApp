import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
// import 'package:gap/gap.dart';
import 'package:mytaskapp/provider/service_provider.dart';

class CardToDoWidgets extends ConsumerWidget {
  const CardToDoWidgets({
    super.key, required this.getIndex,
  });
  final int getIndex;
  
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(data: (todoData) =>Container(
      margin: EdgeInsets.symmetric(vertical: 10),
     width: double.infinity,
     height: 120,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(12),
     ),
     child: Row(
       children: [
         Container(
           decoration: BoxDecoration(
             color: Colors.green,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
           ),
           width: 15,
         ),
         Expanded(child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 12),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ListTile(
                leading: IconButton(onPressed: () => ref.read(serviceProvider).deleteTask(todoData[getIndex].docId!), icon: Icon(CupertinoIcons.trash)),
                 contentPadding: EdgeInsets.zero,
                 title: Text(todoData[getIndex].titleTask ,style: TextStyle(
                  decoration: todoData[getIndex].isDone ? TextDecoration.lineThrough : null
                 ),
                 ),
                 subtitle: Text(todoData[getIndex].description,style: TextStyle(
                  decoration: todoData[getIndex].isDone ? TextDecoration.lineThrough : null
                 ), ),
                 trailing: Transform.scale(
                   scale: 1.5,
                   
                   child: Checkbox(
                     activeColor: Colors.blue.shade800,
                     shape: CircleBorder(),
                     value: todoData[getIndex].isDone, onChanged: (value) async {
                      await FirebaseFirestore.instance
                        .collection('todoApp')
                        .doc(todoData[getIndex].docId)
                         .update({
                       'isDone': value ?? false,
                      });
                     } )),
               ),
             Transform.translate(
               offset: Offset(0, -12),
               // ignore: avoid_unnecessary_containers
               child: Container(
                 child: Column(
                   children: [
                       Divider(
                   thickness: 1.5,
                   color: Colors.grey.shade400,
                 ),
               
                 Row(
                   children: [
                     Text('today'),
                     Gap(12),
                     Text(todoData[getIndex].timeTask)
                   ],
                 )
                   ],
                 ),
               ),
             )
             ],
           ),
         ))
       ],
     ),
    ),
     error:(error ,stackTrace) =>Center(child: Text('error'),) ,
    loading: ()=> Center(child: CircularProgressIndicator(),));
  }
}

