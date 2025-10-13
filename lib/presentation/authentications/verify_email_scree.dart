import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pinput.dart';
import '../../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../routes/route_names.dart';
import '../../utils/custom_form.dart';
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
    final size = MediaQuery.of(context).size;
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
                    height: Utils.vSize(60.0),
                    width: Utils.hSize(60.0),
                    textStyle: GoogleFonts.kumbhSans(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(10.0),
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

  Widget _buildRemember(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Style Preference'),
        Utils.verticalSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: false,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
                  activeColor: primaryColor,
                  onChanged: (bool? val) {},
                ),
                SizedBox(width: 4.w),
                CustomText(text: 'Women', color: greyColor),
              ],
            ),

            Row(
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  value: true,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
                  activeColor: primaryColor,
                  onChanged: (bool? val) {},
                ),
                SizedBox(width: 4.w),
                CustomText(text: 'Men', color: greyColor),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  value: false,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
                  activeColor: primaryColor,
                  onChanged: (bool? val) {},
                ),
                SizedBox(width: 4.w),
                CustomText(text: 'Kids', color: greyColor),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
                  activeColor: primaryColor,
                  onChanged: (bool? val) {},
                ),
                SizedBox(width: 4.w),
                CustomText(text: 'Plus Size', color: greyColor),
              ],
            ),
          ],
        ),
        Utils.verticalSpace(12.h),
        Row(
          children: [
            Checkbox(
              value: false,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
              activeColor: primaryColor,
              onChanged: (bool? val) {},
            ),
            SizedBox(width: 4.w),
            Row(
              children: [
                CustomText(text: 'I agree with the ', color: greyColor),
                CustomText(
                  text: 'Term and Conditions',
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SocialBtn extends StatelessWidget {
  const SocialBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialItem(icon: KImages.google),
        SocialItem(icon: KImages.facebook),
        SocialItem(icon: KImages.apple),
      ],
    );
  }
}

class SocialItem extends StatelessWidget {
  const SocialItem({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: const Color(0xFF040415).withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SvgPicture.asset(icon), Utils.horizontalSpace(10)],
      ),
    );
  }
}
