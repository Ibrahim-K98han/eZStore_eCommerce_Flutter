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

class VerifyPhoneNumberScree extends StatefulWidget {
  const VerifyPhoneNumberScree({super.key});

  @override
  State<VerifyPhoneNumberScree> createState() => _VerifyPhoneNumberScreeState();
}

class _VerifyPhoneNumberScreeState extends State<VerifyPhoneNumberScree> {
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
              CustomImage(path: KImages.verifyPhoneNumber),
              Utils.verticalSpace(20.h),
              CustomText(
                text: "Verify your Phone Number",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Color(0xffFEF7F7),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: CustomImage(path: KImages.delivery),
                      ),
                      CustomText(text: 'Free Shipping'),
                    ],
                  ),
                  Utils.horizontalSpace(30.w),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Color(0xffFEF7F7),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: CustomImage(path: KImages.deliveryReturn),
                      ),
                      CustomText(text: '7 Day Returns'),
                    ],
                  ),
                ],
              ),
              Utils.verticalSpace(24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Phone Number'),
                  Utils.verticalSpace(8.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {},
                          selectorConfig: SelectorConfig(
                            setSelectorButtonAsPrefixIcon: true,
                            leadingPadding: 20,
                            trailingSpace: false,
                            useEmoji: true,
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          selectorTextStyle: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          inputDecoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: greyColor.withOpacity(0.5),
                            ),
                            hintText: '707 797 0462',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                          spaceBetweenSelectorAndTextField: 16,
                        ),
                      ),
                      Utils.horizontalSpace(6.w),
                      Expanded(
                        child: PrimaryButton(
                          borderRadiusSize: 0,
                          minimumSize: Size(82.w, 50.h),
                          text: 'Send',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Utils.verticalSpace(14.h),
                  CustomText(text: 'Verification Code'),
                  Utils.verticalSpace(8.h),
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
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (String code) {},
                      onCompleted: (String code) {},
                    ),
                  ),
                  Utils.verticalSpace(12.h),
                  Center(
                    child: CustomText(
                      text: 'Didn’t get the code? (Resend in 30s)',
                    ),
                  ),
                ],
              ),

              Utils.verticalSpace(20.h),
              PrimaryButton(
                bgColor: Color(0xff111827),
                borderRadiusSize: 0,
                text: "Submit",
                fontSize: 14.sp,
                onPressed: () {
                  // Navigator.pushNamed(context, RouteNames.mainScreen);
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
