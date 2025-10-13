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

class CreateNewPassScree extends StatefulWidget {
  const CreateNewPassScree({super.key});

  @override
  State<CreateNewPassScree> createState() => _CreateNewPassScreeState();
}

class _CreateNewPassScreeState extends State<CreateNewPassScree> {
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
              CustomImage(path: KImages.createNewPass),
              Utils.verticalSpace(20.h),
              CustomText(
                text: "Create a new Password",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(20.h),
              CustomText(
                text:
                    '''Enter and confirm your new password to account. Make sure it's secure and easy to remember.''',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              Utils.verticalSpace(20.h),

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
                    hintText: 'new password',
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
                label: 'Confirm Password',
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
                    hintText: 'confirm password',
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

              Utils.verticalSpace(30.h),
              PrimaryButton(
                bgColor: Color(0xff111827),
                borderRadiusSize: 0,
                text: "Update Password",
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.passwordSuccessScree);
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
