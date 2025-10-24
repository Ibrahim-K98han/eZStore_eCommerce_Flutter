import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Questions",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 80,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'How can I track my order?',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(12.h),
            HtmlWidget(
              '''
        
        Once your order has been confirmed and shipped, you can easily track its progress in real time.
        
        Go to “My Orders” from the main menu or profile section.
        
        Select the order you want to track.
        
        Tap “Track Order” to view the latest shipment updates including the current status, estimated delivery date, and courier details.
        
        You can also find a tracking number and a direct link to the courier’s tracking page for more detailed updates.
        
        You’ll receive push notifications and email alerts when your order is shipped, out for delivery, or delivered successfully.''',
            ),
          ],
        ),
      ),
    );
  }
}
