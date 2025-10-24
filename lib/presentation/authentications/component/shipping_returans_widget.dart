import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingReturansWidget extends StatelessWidget {
  const ShippingReturansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Color(0xffFEF7F7),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: CustomImage(path: KImages.delivery),
            ),
            Utils.horizontalSpace(6.w),
            CustomText(text: 'Free Shipping'),
          ],
        ),
        Utils.horizontalSpace(30.w),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Color(0xffFEF7F7),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: CustomImage(path: KImages.deliveryReturn),
            ),
            Utils.horizontalSpace(6.w),
            CustomText(text: '7 Day Returns'),
          ],
        ),
      ],
    );
  }
}
