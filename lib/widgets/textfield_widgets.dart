
import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({
    super.key, required this.hintText, required this.maxLine, required this.txtController,
  });

  final String hintText;
  final int maxLine;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        controller: txtController,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText),
          maxLines: maxLine,
        
      ));
  }
}