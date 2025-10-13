import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: CustomImage(path: KImages.logoWithText, height: 30.h),
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
              CustomFormWidget(
                label: 'Email or Phone Number',
                bottomSpace: 12.sp,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
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
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xffF8FAFC),
                    hintText: 'password',
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
                bgColor: Color(0xff111827),
                borderRadiusSize: 0,
                text: "Continue",
                fontSize: 14.sp,

                onPressed: () {
                  // Navigator.pushNamed(context, RouteNames.mainScreen);
                },
              ),
              Utils.verticalSpace(12.h),
              const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: 'Don’t have an account yet? ',
                      fontSize: 16,
                    ),
                    CustomText(
                      text: 'Resister',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
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
          onTap: () {},
          child: const CustomText(
            text: 'Forget Password',
            fontWeight: FontWeight.w600,
            color: Color(0xFFE94222),
            fontSize: 14,
          ),
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
