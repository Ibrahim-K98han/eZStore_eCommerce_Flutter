import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Privacy Policy",
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
            CustomText(
              text: 'Privacy Policy',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(12.h),
            HtmlWidget(
              '''1. Introduction

Welcome to eZStore. By using our app, you agree to the following terms and conditions. Please read them carefully before making any purchase.

2. Account Responsibility

You are responsible for maintaining confidentiality of your account and password. eZStore is not liable for any unauthorized use of your account.

3. Orders & Payments

All orders are subject to product availability and price confirmation. Payments made through the app are processed securely via verified payment gateways.

4. Shipping & Delivery

Delivery timelines vary depending on product type and location. Tracking details will be provided once your order is shipped.

5. Updates to Terms

We may update these Terms periodically. Continued use of the app after updates means you accept the revised terms.

6. Contact Us

If you have any questions about these Terms, please contact us at:
📧 support@ezstoreapp.com

Would you like me to convert this into a Flutter “Terms & Conditions” screen UI with scrollable text and proper styling (like section titles, spacing, etc.)?''',
            ),
          ],
        ),
      ),
    );
  }
}
