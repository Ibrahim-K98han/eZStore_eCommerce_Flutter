import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDeleteScreen extends StatelessWidget {
  const AccountDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Account Delete",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 160.w,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                ),
                child: Center(child: CustomText(text: 'No')),
              ),
            ),
            Utils.horizontalSpace(12.w),
            Expanded(
              child: PrimaryButton(
                bgColor: textColor,
                minimumSize: Size(160.w, 44),
                borderRadiusSize: 0.r,
                text: 'Yes',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            CustomImage(path: KImages.deviceDelete, width: 80.w, height: 80),
            Utils.verticalSpace(20),
            CustomText(
              text: 'Do you Really want to Delete\nyour Account?',
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(10),
            CustomText(
              text: 'For verification purpose fille down inputs',
              fontSize: 12.sp,
              color: sTextColor,
            ),
            Utils.verticalSpace(30),
            CustomFormWidget(
              label: 'Email',
              bottomSpace: 12.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: greyColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),

                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  hintText: 'codylee@gmail.com',
                ),
              ),
            ),
            CustomFormWidget(
              label: 'Password',
              bottomSpace: 14.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: greyColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),

                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  hintText: '*******',
                  suffixIcon: IconButton(
                    splashRadius: 18.0,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off_outlined,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
