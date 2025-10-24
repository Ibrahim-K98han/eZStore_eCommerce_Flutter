import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class PackagedItemsWidget extends StatelessWidget {
  const PackagedItemsWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: text, fontWeight: FontWeight.w500),
        Utils.verticalSpace(8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              path: KImages.product2,
              width: 66.w,
              height: 66.h,
              fit: BoxFit.cover,
            ),
            Utils.horizontalSpace(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Vibrant Sunset Maxi Dress',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Utils.verticalSpace(4.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          CustomText(text: 'Color: ', fontSize: 11.sp),
                          CustomText(
                            text: 'Gray',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Utils.horizontalSpace(10.w),
                      Row(
                        children: [
                          CustomText(text: 'Size: ', fontSize: 11.sp),
                          CustomText(
                            text: 'M',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Utils.verticalSpace(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: '\$59.99',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: 'x1',
                        fontSize: 12.sp,
                        color: textColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}