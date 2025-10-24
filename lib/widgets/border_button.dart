import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';
import 'custom_text.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Utils.symmetric(h: 12.w, v: 6.h),
        decoration: BoxDecoration(border: Border.all(color: btnBorderColor)),
        child: CustomText(
          text: text,
          fontSize: 11.sp,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
