import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: Utils.all(value: 6.r),
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: greyLightColor,
            shape: BoxShape.circle,
          ),
          child: CustomImage(
            path: KImages.addressHome,
            width: 14.w,
            height: 14.h,
          ),
        ),
        Utils.horizontalSpace(8.w),
        Expanded(
          child: CustomText(
            text:
            '''House-8, Road-7, Section-10, Mirpur, Dhaka - 1216, BD 1216 A*********r +880 16*****933''',
            fontSize: 12.sp,
            color: sTextColor,
            fontWeight: FontWeight.w500,
            maxLine: 3,
            overflow: TextOverflow.fade,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}