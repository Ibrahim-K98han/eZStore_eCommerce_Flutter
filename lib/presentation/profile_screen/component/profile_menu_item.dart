import 'package:ezstore/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.img,
    required this.text,
    required this.onTap,
     this.textColor = tTextColor,
  });

  final String img;
  final String text;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            CustomImage(path: img, width: 24.w, height: 24.h),
            Utils.horizontalSpace(10.w),
            CustomText(
              text: text,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
