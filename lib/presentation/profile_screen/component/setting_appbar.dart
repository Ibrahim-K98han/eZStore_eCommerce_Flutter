import 'package:ezstore/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -20.h,
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomAppBar(
            bgColor: snowPink,
            title: 'Settings',
            titleCenter: true,
          ),
        ),
        Positioned(
          top: 90.h,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            leading: CustomImage(
              path: KImages.person,
              width: 36.w,
              height: 36.h,
              fit: BoxFit.cover,
            ),
            title: CustomText(text: 'Jonson Roy', fontWeight: FontWeight.w500),
            subtitle: CustomText(
              text: 'jonsonroy@gmail.com',
              fontSize: 11.sp,
              color: sTextColor,
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.myProfileScreen);
              },
              child: Container(
                height: 30.h,
                width: 74.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE2E8F0), width: 1.w),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: 'Edit',
                        fontSize: 11.sp,
                        color: sTextColor,
                      ),
                      Utils.horizontalSpace(6.w),
                      CustomImage(
                        path: KImages.edits,
                        width: 14.w,
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
