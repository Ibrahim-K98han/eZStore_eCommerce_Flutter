import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturanPolicyBottomSheet extends StatefulWidget {
  const ReturanPolicyBottomSheet({super.key});

  @override
  State<ReturanPolicyBottomSheet> createState() =>
      _ReturanPolicyBottomSheetState();
}

class _ReturanPolicyBottomSheetState extends State<ReturanPolicyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,

      padding: Utils.symmetric(h: 17.0, v: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'eZStore Commitment',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImage(
                  path: KImages.closeIcon,
                  height: 32.h,
                  width: 32.w,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(10.h),
          Utils.horizontalLine(),
          Utils.verticalSpace(10.h),
          Row(
            children: [
              CustomImage(
                path: KImages.donate,
                height: 20.h,
                width: 20.w,
                fit: BoxFit.cover,
              ),
              Utils.horizontalSpace(10.w),
              CustomText(
                text: 'Return & Refund Policy',
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ],
          ),
          Utils.verticalSpace(8.h),
          CustomText(
            text:
                'Eligible for returns and refund within the designated order protection period',
            fontSize: 11.sp,
            color: textColor,
          ),
          Utils.verticalSpace(15.h),
          PrimaryButton(
            borderRadiusSize: 0,
            minimumSize: Size(double.maxFinite, 44.h),
            text: 'Learn More',
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.shippingPolicyScreen);
            },
          ),
        ],
      ),
    );
  }
}
