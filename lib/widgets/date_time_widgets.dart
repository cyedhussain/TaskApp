// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mytaskapp/constant/app_style.dart';

class DateAndTimeWidget extends ConsumerWidget {
  const DateAndTimeWidget({
    super.key, required this.titleText, required this.valueText, required this.iconsection, required this.onTap,
  });

  final String titleText;
  final String valueText;
  final IconData iconsection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return Expanded(  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText,style: AppStyle.headingOne,),
          Gap(6),
          Material(
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12)
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () =>onTap(),
                child: Container(
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
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

