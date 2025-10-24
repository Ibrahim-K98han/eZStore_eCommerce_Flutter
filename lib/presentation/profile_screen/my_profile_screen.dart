import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_dropdown_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import 'component/my_profile_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          text: "Profile Settings",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: MyProfileWidget(),
    );
  }
}

