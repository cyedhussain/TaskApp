// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytaskapp/provider/radio_provider.dart';

class RadioWidgets extends ConsumerWidget {
  const RadioWidgets({
    super.key, required this.radioTitle, required this.colorCategory, required this.valueinput, required this.onChangevalue,
  });
  final String radioTitle;
  final Color colorCategory;
  final int valueinput;
  final VoidCallback onChangevalue;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // ignore: unused_local_variable
    final radio = ref.watch(radioProvider);
    return Material(
      
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.amberAccent),
        child: RadioListTile(
          activeColor: colorCategory,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: Offset(-16, 0),
            child:  Text(radioTitle,style: TextStyle(color: colorCategory,fontWeight: FontWeight.w700),)),
          value: valueinput,
          groupValue: radio,
          onChanged: (value) => onChangevalue(),
          
          ),
      ),
    );
  }
}

