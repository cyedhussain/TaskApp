// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mytaskapp/constant/app_style.dart';

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({
    super.key, required this.titleText, required this.valueText, required this.iconsection,
  });

  final String titleText;
  final String valueText;
  final IconData iconsection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText,style: AppStyle.headingOne,),
          Gap(6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
            children: [
              Icon(iconsection),
              Text(valueText),
            ],
          ),
          ),
          
        ],
      ),
    );
  }
}

