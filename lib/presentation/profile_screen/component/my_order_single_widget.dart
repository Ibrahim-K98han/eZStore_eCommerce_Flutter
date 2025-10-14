import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class MyOrderSingleWidget extends StatelessWidget {
  const MyOrderSingleWidget({super.key, required this.img, required this.text});

  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(path: img, width: 20.w, height: 20.h, fit: BoxFit.cover),
        Utils.verticalSpace(4.h),
        CustomText(text: text),
      ],
    );
  }
}