import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_app_bar.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingPolicyScreen extends StatelessWidget {
  const ShippingPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shipping Policy'),
      body: Padding(
        padding: Utils.symmetric(h: 16.w, v: 0.h),
        child: Column(
          children: [
            ShippingPolicyWidget(heading: '📦 1. Order Processing Time'),
            ShippingPolicyWidget(
              heading: '🌍 2. Shipping Methods & Delivery Time',
            ),
            ShippingPolicyWidget(heading: '🚀 3. Shipping Charges'),
            ShippingPolicyWidget(
              heading: '🌍 2. Shipping Methods & Delivery Time',
            ),
            ShippingPolicyWidget(heading: '📦 1. Order Processing Time'),
          ],
        ),
      ),
    );
  }
}

class ShippingPolicyWidget extends StatelessWidget {
  const ShippingPolicyWidget({super.key, required this.heading});
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: heading, fontWeight: FontWeight.w500),
        Utils.verticalSpace(8.h),
        CustomText(
          text:
              'Orders are processed within 1–2 business days after payment confirmation. Processing may take longer during holidays or high-demand periods.',
          fontSize: 12.sp,
          color: sTextColor,
        ),
        Utils.verticalSpace(8.h),
      ],
    );
  }
}
