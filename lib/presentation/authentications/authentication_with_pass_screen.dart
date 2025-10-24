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

class AuthenticationWithPassScreen extends StatefulWidget {
  const AuthenticationWithPassScreen({super.key});

  @override
  State<AuthenticationWithPassScreen> createState() =>
      _AuthenticationWithPassScreenState();
}

class _AuthenticationWithPassScreenState
    extends State<AuthenticationWithPassScreen> {
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
              Utils.verticalSpace(90.h),
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
              _buildRemember(context),

              Utils.verticalSpace(12.h),
              PrimaryButton(
                bgColor: textColor,
                borderRadiusSize: 0,
                minimumSize: Size(double.infinity, 44),
                text: "Sign In",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.mainScreen);
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
                        Navigator.pushNamed(context, RouteNames.registerScreen);
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
              const SocialBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRemember(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: Utils.only(top: 0.0),
              child: Checkbox(
                value: false,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
                activeColor: primaryColor,
                onChanged: (bool? val) {},
              ),
            ),
            const CustomText(
              text: 'Remember me',
              color: greyColor,
              height: 1.6,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.forgotPasswordScree);
          },
          child: CustomText(
            text: 'Forget Password',
            fontWeight: FontWeight.w400,
            color: Color(0xFFFF4747),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
