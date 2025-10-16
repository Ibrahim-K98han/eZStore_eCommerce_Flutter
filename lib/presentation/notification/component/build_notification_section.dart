import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Data/dummy_data.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';
import 'notification_widget.dart';

class BuildNotificationSection extends StatelessWidget {
  const BuildNotificationSection({
    super.key,
    required this.label,
    required this.items,
  });

  final String label;
  final List<NotificationItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 4.h),
            child: CustomText(
              text: label,
              fontSize: 11.sp,
              color: sTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Notification list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: Utils.symmetric(),
            itemCount: items.length,
            separatorBuilder:
                (_, __) => Divider(height: 0.1.h, color: Color(0xffF1F5F9)),
            itemBuilder: (_, index) {
              final item = items[index];
              return NotificationWidget(
                img: item.imageUrl,
                title: item.title,
                bg: item.bg,
                subTitle: 'Your order #78423 has been shipped. Track delivery',
                time: '2:15 PM',
              );
            },
          ),
        ],
      ),
    );
  }
}
