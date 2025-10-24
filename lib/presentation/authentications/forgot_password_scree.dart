import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../routes/route_names.dart';
import '../../utils/custom_form.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

class ForgotPasswordScree extends StatefulWidget {
  const ForgotPasswordScree({super.key});

  @override
  State<ForgotPasswordScree> createState() => _ForgotPasswordScreeState();
}

class _ForgotPasswordScreeState extends State<ForgotPasswordScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: Utils.symmetric(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.verticalSpace(100.h),
              CustomImage(path: KImages.forgotPass),
              Utils.verticalSpace(20.h),
              CustomText(
                text: "Forgot Password",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(18.h),

              CustomFormWidget(
                label: 'Email or Phone Number',
                bottomSpace: 16.sp,
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

              Utils.verticalSpace(20.h),
              PrimaryButton(
                bgColor: Color(0xff111827),
                borderRadiusSize: 0,
                minimumSize: Size(double.infinity, 44),
                text: "Forgot Password",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.verifyEmailScree);
                },
              ),
              Utils.verticalSpace(12.h),
            ],
          ),
        ),
      ),
    );
  }

 }
