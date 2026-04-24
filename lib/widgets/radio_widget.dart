// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RadioWidgets extends StatelessWidget {
  const RadioWidgets({
    super.key, required this.radioTitle, required this.colorCategory,
  });
  final String radioTitle;
  final Color colorCategory;
  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.amberAccent),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: Offset(-22, 0),
            child:  Text(radioTitle,style: TextStyle(color: colorCategory,fontWeight: FontWeight.w700),)),
          value: 1,
          groupValue: 0,
          onChanged: (value){},
          
          ),
      ),
    );
  }
}

