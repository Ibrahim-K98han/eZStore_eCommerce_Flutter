import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashSaleHeading extends StatelessWidget {
  const FlashSaleHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 0.0, v: 6.h),
      decoration: BoxDecoration(color: snowPink),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              CustomText(text: "Fla", fontWeight: FontWeight.w600),
              CustomImage(path: KImages.flash),
              CustomText(text: "h Sale", fontWeight: FontWeight.w600),
            ],
          ),
          Utils.horizontalSpace(20.w),
          CustomText(
            text: "Ends: ",
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: "Oct8, 11:59 GMT +06:00",
            fontSize: 10.sp,
            color: sTextColor,
          ),
        ],
      ),
    );
  }
}
