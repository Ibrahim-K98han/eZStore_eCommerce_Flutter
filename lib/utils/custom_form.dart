import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';
import '../widgets/custom_text.dart';

class CustomFormWidget extends StatelessWidget {
  final String label;
  final Widget child;
  final double bottomSpace;
  final Color labelColor;

  const CustomFormWidget({
    super.key,
    required this.label,
    required this.child,
    this.bottomSpace = 0.0,
    this.labelColor = blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 14.sp,
          color: Color(0xff334155),
          fontWeight: FontWeight.w400,
        ),
        Utils.verticalSpace(4.h),
        child,
        Utils.verticalSpace(bottomSpace),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLine,
    this.keyboardType,
  });

  final String label;
  final String hintText;
  TextInputType? keyboardType;

  int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 14.sp,
          color: Color(0xff334155),
          fontWeight: FontWeight.w400,
        ),
        Utils.verticalSpace(4.h),
        TextField(
          keyboardType: keyboardType,
          maxLines: maxLine,
          decoration: InputDecoration(
            fillColor: const Color(0xffF8FAFC),
            //labelText: label,
            hintText: hintText,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            hintStyle: const TextStyle(
              color: Colors.black,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: borderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: borderColor,
              ),
            ),
          ),
        ),
        Utils.verticalSpace(10.0),
      ],
    );
  }
}
