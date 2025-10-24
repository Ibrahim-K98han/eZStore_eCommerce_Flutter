import 'package:ezstore/presentation/authentications/component/shipping_returans_widget.dart';
import 'package:ezstore/presentation/authentications/component/social_btn.dart';
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

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImage(path: KImages.logoWithText, height: 32.h),
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: Utils.symmetric(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.verticalSpace(100.h),
              CustomText(
                text: "Access your Account",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(12.h),
              ShippingReturansWidget(),
              Utils.verticalSpace(24.h),
              CustomFormWidget(
                label: 'Email or Phone Number',
                bottomSpace: 16.sp,
                child: TextFormField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.zero,
                    //   borderSide: BorderSide(
                    //     color: greyColor.withOpacity(0.2),
                    //     width: 0.5,
                    //   ),
                    // ),
                    hintText: 'codylee@gmail.com',
                  ),
                ),
              ),

              Utils.verticalSpace(12.h),
              PrimaryButton(
                bgColor: textColor,
                borderRadiusSize: 0,
                minimumSize: Size(double.infinity, 44),
                text: "Continue",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.authenticationWithPassScreen,
                  );
                },
              ),
              Utils.verticalSpace(12.h),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: 'Don’t have an account yet? ',
                      fontSize: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.authenticationWithPassScreen,
                        );
                      },
                      child: CustomText(
                        text: 'Resister',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Utils.verticalSpace(12.h),
              Row(
                children: [
                  Expanded(child: Divider(color: Color(0xffE2E8F0))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomText(text: 'OR'),
                  ),
                  Expanded(child: Divider(color: Color(0xffE2E8F0))),
                ],
              ),
              Utils.verticalSpace(20.h),
              SocialBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
