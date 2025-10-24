import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Notification Setting",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            NotificationWidget(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.pushNotificationScreen);
              },
              text: 'Push Notification',
            ),
            Padding(
              padding: Utils.only(top: 15, bottom: 15),
              child: Utils.horizontalLine(),
            ),
            NotificationWidget(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.emailNotificationScreen,
                );
              },
              text: 'Email Notifications',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, fontWeight: FontWeight.w500),
          Icon(Icons.arrow_forward_ios, size: 18.sp),
        ],
      ),
    );
  }
}
