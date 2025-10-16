import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/widgets/custom_app_bar.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/route_names.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_text.dart';
import 'component/build_notification_section.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40, // 👈 increase AppBar height for top padding
        titleSpacing: 0,   // optional: remove default side spacing
        backgroundColor: Colors.white, // optional: customize background
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0), // 👈 top padding for title
          child: CustomText(
            text: "Notification",
            fontSize: 16.sp, // optional: style customization
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          GestureDetector(
            onTap: (){
            Navigator.pop(context);
            },
            child: Padding(
              padding: Utils.only(right: 16.w, top: 12.0),// 👈 match top padding
              child: Row(
                children: [
                  CustomImage(
                    path: KImages.paintBrush,
                    height: 24, // optional: control icon size
                    width: 24,
                  ),
                  Utils.horizontalSpace(8.w),
                  CustomImage(
                    path: KImages.setting,
                    height: 24, // optional: control icon size
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: ListView(
        children: [
          Utils.verticalSpace(10.h),
          BuildNotificationSection(label: 'Today', items: notification),
          BuildNotificationSection(label: 'Yesterday', items: notification),
          BuildNotificationSection(label: 'Earlier', items: notification),
        ],
      ),
    );
  }
}




