import 'package:ezstore/presentation/order_confirm/order_confirm_screen.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailNotificationScreen extends StatelessWidget {
  const EmailNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Email Notification",
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
            PushNotificationWidget(
              text: 'Orders',
              subText:
                  'Orders Status, tracking announcements, price alerts & more',
            ),
            Padding(
              padding: Utils.only(bottom: 10, top: 10),
              child: Utils.horizontalLine(),
            ),
            PushNotificationWidget(
              text: 'Promotions',
              subText: 'Don’t miss out on discounts, special offers, and more',
            ),
            Utils.verticalSpace(10),
            PushNotificationWidget(
              text: 'Activates',
              subText: 'Notification related to your account and more',
            ),
            Padding(
              padding: Utils.only(bottom: 10, top: 10),
              child: Utils.horizontalLine(),
            ),
            PushNotificationWidget(
              text: 'Coins',
              subText:
                  'Daily check-in reminders, coins collection notices and more ',
            ),
          ],
        ),
      ),
    );
  }
}

class PushNotificationWidget extends StatelessWidget {
  const PushNotificationWidget({
    super.key,
    required this.text,
    required this.subText,
  });

  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: text, fontWeight: FontWeight.w500),
            SwitchWidget(initialValue: false, onToggle: (value) {}),
          ],
        ),
        Utils.verticalSpace(4),
        CustomText(text: subText, fontSize: 11.sp, color: sTextColor),
      ],
    );
  }
}
