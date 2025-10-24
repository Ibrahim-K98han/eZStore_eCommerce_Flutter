import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';

class TrackingHeadingSection extends StatelessWidget {
  const TrackingHeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 35.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffF1FCF1), Color(0xffF3F4F3)],
            ),
          ),
          child: Center(
            child: CustomText(
              text: 'Delivery: Oct 18 - 23',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
        Utils.verticalSpace(16.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Vibrant Sunset Maxi Dress',
              fontSize: 12.sp,
              color: sTextColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: 'Tracking number: ',
                      fontSize: 12.sp,
                      color: sTextColor,
                    ),
                    CustomText(
                      text: '1Z9999W80307724443',
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                  ],
                ),
                CustomText(
                  text: 'Copy',
                  fontSize: 12.sp,
                  color: secondaryColor,
                ),
              ],
            ),
          ],
        ),
        Utils.verticalSpace(12.h),
        Utils.horizontalLine(),
        Utils.verticalSpace(16.h),
      ],
    );
  }
}