import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "App Info",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImage(
                path: KImages.logoWithText,
                width: 111.w,
                height: 28,
              ),
            ),
            Utils.verticalSpace(16),
            HtmlWidget(
              '''eZStore is your one-stop destination for fashion, electronics, and lifestyle products. Enjoy seamless browsing, secure checkout, real-time order tracking, and exclusive deals — all in one simple app.''',
            ),
            Utils.verticalSpace(24),
            CustomText(text: 'Legal & Privacy:', fontWeight: FontWeight.w500),
            Utils.verticalSpace(4),
            CustomText(
              text: '''Terms of Service
Privacy Policy''',
            ),
            Utils.verticalSpace(24),
            CustomText(text: 'Versoin: v2.5.3 (Build 142)'),
            Utils.verticalSpace(8),
            Row(
              children: [
                CustomText(text: 'Build Date:'),
                CustomText(text: ' June 2025', fontWeight: FontWeight.w500),
              ],
            ),
            Utils.verticalSpace(24),
            CustomText(text: 'Support Contact:'),
            Utils.verticalSpace(4),
            CustomText(text: 'Email: support@ezstoreapp.com'),
            Utils.verticalSpace(4),
            CustomText(text: 'Phone: +123 456 7890'),
          ],
        ),
      ),
    );
  }
}
