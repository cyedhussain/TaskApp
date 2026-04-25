import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mytaskapp/common/show_modal.dart';
import 'package:mytaskapp/widgets/card_todo_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade300,
            radius: 25,
            child: Image.asset('assets/images/avatar.jpg'),
          ),
          title:  Text('Hello I\'m',style: TextStyle(fontSize: 12,color: Colors.grey),),
          subtitle: const Text('Hussain Naqvi',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        ),
      actions: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.calendar)),
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell))
          ],
        ),
        
        )
      ],
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Gap(14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today\'s Task',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text('Friday 10 April'),
                    ],
                  ),

                  //  ---------------[added new task button and the bottommodalsheet] ------------------------
                  ElevatedButton(onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    context: context,
                     builder: (context) => AddNewTaskModal() ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ), child: Text('+New Task',style: TextStyle(color: Colors.white),),),
                      
                ],
              ),

         ///  ----------------------------[card and lists sections] ---------------------------
         Gap(20),
         ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder:(context ,index) => CardToDoWidgets() )

            ],
          ),
        ),
      ),
    );
  }
}

