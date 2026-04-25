import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardToDoWidgets extends StatelessWidget {
  const CardToDoWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                 contentPadding: EdgeInsets.zero,
                 title: Text('learning flutter development',),
                 subtitle: Text('learn state management and backend'),
                 trailing: Transform.scale(
                   scale: 1.5,
                   
                   child: Checkbox(
                     activeColor: Colors.blue.shade800,
                     shape: CircleBorder(),
                     value: true, onChanged: (value) {} )),
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
                     Text('Today'),
                     Gap(12),
                     Text('9:12 AM')
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
    );
  }
}

