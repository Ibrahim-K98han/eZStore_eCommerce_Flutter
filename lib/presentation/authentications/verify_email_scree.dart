import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../routes/route_names.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

class VerifyEmailScree extends StatefulWidget {
  const VerifyEmailScree({super.key});

  @override
  State<VerifyEmailScree> createState() => _VerifyEmailScreeState();
}

class _VerifyEmailScreeState extends State<VerifyEmailScree> {
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
                text: "Verify your Email to Continue",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(20.h),
              CustomText(
                text:
                    '''We’ve sent a 6-digit verification code to jonson***@gmail.com Please enter the code below to activate your account.''',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              Utils.verticalSpace(20.h),

              Center(
                child: Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    height: Utils.vSize(44.0),
                    width: Utils.hSize(44.0),
                    textStyle: GoogleFonts.kumbhSans(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  onChanged: (String code) {},
                  onCompleted: (String code) {},
                ),
              ),

              Utils.verticalSpace(30.h),
              PrimaryButton(
                bgColor: Color(0xff111827),
                borderRadiusSize: 0,
                minimumSize: Size(double.infinity, 44),
                text: "Verify OTP",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.createNewPassScree);
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
