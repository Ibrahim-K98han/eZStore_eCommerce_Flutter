import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.time,
    required this.bg,
  });

  final String img;
  final String title;
  final String subTitle;
  final String time;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.w,
        height: 40.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
        ),
        child: CustomImage(path: img),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              text: title,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomText(text: time, fontSize: 11.sp, color: sTextColor),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: CustomText(
          text: subTitle,
          maxLine: 1,
          overflow: TextOverflow.ellipsis,
          fontSize: 11.sp,
          color: sTextColor,
        ),
      ),
    );
  }
}