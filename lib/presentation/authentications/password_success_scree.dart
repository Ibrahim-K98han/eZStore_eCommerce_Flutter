import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../routes/route_names.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

class PasswordSuccessScree extends StatefulWidget {
  const PasswordSuccessScree({super.key});

  @override
  State<PasswordSuccessScree> createState() => _PasswordSuccessScreeState();
}

class _PasswordSuccessScreeState extends State<PasswordSuccessScree> {
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
              Utils.verticalSpace(200.h),
              CustomImage(path: KImages.createNewPass),
              Utils.verticalSpace(50.h),
              CustomText(
                text: "Password Updated Successfully",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(20.h),
              CustomText(
                text:
                    '''Your new password has been saved. You can now log in to your account with your updated credentials.''',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),

              Utils.verticalSpace(30.h),
              PrimaryButton(
                bgColor: Color(0xff111827),
                borderRadiusSize: 0,
                minimumSize: Size(double.infinity, 44),
                text: "Back to Sign In",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.authenticationsScreen,
                  );
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
