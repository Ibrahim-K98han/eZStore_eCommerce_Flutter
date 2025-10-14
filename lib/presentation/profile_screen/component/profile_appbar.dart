import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: Utils.vSize(90.h),
      backgroundColor: transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CustomImage(
                        path: KImages.person,
                        fit: BoxFit.cover,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    Utils.horizontalSpace(10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Jonson Roy',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                        CustomText(
                          text: 'jonsonroy@gmail.com',
                          fontSize: 11.sp,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const CustomImage(
                        path: KImages.notification,
                        height: 26,
                        width: 26,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const CustomImage(
                        path: KImages.notification,
                        height: 26,
                        width: 26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
