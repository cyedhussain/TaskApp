// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mytaskapp/constant/app_style.dart';
import 'package:mytaskapp/modal/todo_modal.dart';
import 'package:mytaskapp/provider/date_time_provider.dart';
import 'package:mytaskapp/provider/radio_provider.dart';
import 'package:mytaskapp/provider/service_provider.dart';
import 'package:mytaskapp/widgets/date_time_widgets.dart';
import 'package:mytaskapp/widgets/radio_widget.dart';
import 'package:mytaskapp/widgets/textfield_widgets.dart';
class AddNewTaskModal extends ConsumerWidget {
   AddNewTaskModal({
    super.key,
  });
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // ignore: unused_local_variable
    final radioCategory = ref.watch(radioProvider);
    // ignore: unused_local_variable
    final dateprov =ref.watch(dateProvider);
    final timeprov =ref.watch(timeProvider);
    return Container(
      padding: EdgeInsets.all(30),
    height: MediaQuery.of(context).size.height * 0.70,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius:BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)) 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("New Task ToDo",textAlign: TextAlign.center,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),)
            ),

            /// divider
          Divider(
            thickness: 1.5,
            color: Colors.grey.shade300,
          ),

          const Gap(12),

          Text('Title Task',style:AppStyle.headingOne),
          const Gap(6),
          TextFieldWidgets(hintText: 'Add New Task', maxLine:1, txtController: titleController),
          const Gap(12),
          Text('Description',style: AppStyle.headingOne,),
          const Gap(6),
          TextFieldWidgets(hintText: 'Add Description', maxLine: 3, txtController: descriptionController,),
          const Gap(12),
          Text('Category',style: AppStyle.headingOne,),
          const Gap(6),
          Row(
            children: [
              Expanded(child: 
              RadioWidgets(radioTitle: 'learn', colorCategory: Colors.green, valueinput: 1, onChangevalue: ()=> ref.read(radioProvider.notifier).update((state) => 1 ) ,)
              ),
              Expanded(child: 
              RadioWidgets(radioTitle: 'work', colorCategory: Colors.blueAccent.shade200, valueinput: 2, onChangevalue: ()=>ref.read(radioProvider.notifier).update((state)=>2 ),)
              ),
              Expanded(child: 
              RadioWidgets(radioTitle: 'general', colorCategory: Colors.cyan, valueinput: 3, onChangevalue: ()=>ref.read(radioProvider.notifier).update((state)=>3 ),)
              ),
            ],
          ),

          // date and time section 

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: avoid_unnecessary_containers
              DateAndTimeWidget(titleText:'Date', valueText: dateprov, iconsection: CupertinoIcons.calendar, onTap: () async {
                // ignore: unused_local_variable
                final getValue =await showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime(2027));
                if (getValue !=null) {
                  final format =DateFormat.yMd();
                  // print(format.toString());
                  ref.read(dateProvider.notifier).update((state)=> format.format(getValue));
                }

                
              }
               ),
              Gap(22),
              DateAndTimeWidget(titleText:'Time', valueText: timeprov, iconsection: CupertinoIcons.clock, onTap: () async {
                final getTimeValue = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (getTimeValue !=null) {
                  ref.read(timeProvider.notifier).update((state) => getTimeValue.format(context));
                }
              },),
              
            ],
          ),
          Gap(12),
          // button section 

          ///--------------[cancel button] ------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: ElevatedButton(onPressed: () => Navigator.pop(context),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  color: Colors.blue,
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ), child: Text('Cancel')
              )
              ),
              Gap(12),
              /// ------------------------[create button]--------------------------
              Expanded(child: ElevatedButton(onPressed: (){

                  final getRadioValues =ref.read(radioProvider);
                  String category=' ';
                  switch (getRadioValues) {
                    case 1:
                      category ='Learning';
                      break;
                    case 2:
                      category ='Working';
                      break;
                    case 3:
                      category ='General';
                      break;    
                    default:
                  }

                ref.read(serviceProvider).addTodoTask(
                  TodoModal(titleTask: titleController.text,
                   description: descriptionController.text, 
                   category: category, 
                   dateTask: ref.read(dateProvider),
                    timeTask: ref.read(timeProvider),
                    isDone: false,
                    )
                );  

                titleController.clear();
                descriptionController.clear();
                ref.read(radioProvider.notifier).update((state)=>0 );
                Navigator.pop(context);

              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 14)
              ), child: Text('Create')
              )
              ),
            ],
          )

        ],
      ),
    );
  }
}

