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

class CreateNewPassScree extends StatefulWidget {
  const CreateNewPassScree({super.key});

  @override
  State<CreateNewPassScree> createState() => _CreateNewPassScreeState();
}

class _CreateNewPassScreeState extends State<CreateNewPassScree> {
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
                minimumSize: Size(double.infinity, 44),
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

  }

