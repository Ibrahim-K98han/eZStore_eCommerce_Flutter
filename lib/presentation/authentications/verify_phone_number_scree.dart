import 'package:ezstore/presentation/authentications/component/shipping_returans_widget.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pinput.dart';
import '../../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
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
              ShippingReturansWidget(),
              Utils.verticalSpace(24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Phone Number'),
                  Utils.verticalSpace(8.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
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
                          minimumSize: Size(double.infinity, 48),
                          borderRadiusSize: 0,
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
                        height: Utils.vSize(44.0),
                        width: Utils.hSize(44.0),
                        textStyle: GoogleFonts.kumbhSans(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(0.0),
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
                minimumSize: Size(double.infinity, 44),
                borderRadiusSize: 0,
                text: "Submit",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.authenticationWithPassScreen,
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
