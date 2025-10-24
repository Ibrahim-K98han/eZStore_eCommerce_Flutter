import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Password Change",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            CustomFormWidget(
              label: 'Current Password',
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
            CustomFormWidget(
              label: 'New Password',
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
            CustomFormWidget(
              label: 'Confirmed New Password',
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
            Utils.verticalSpace(30),
            PrimaryButton(
              borderRadiusSize: 0.0,
              minimumSize: Size(double.infinity, 44),
              text: 'Update',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
