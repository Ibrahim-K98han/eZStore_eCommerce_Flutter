import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportResponseScreen extends StatelessWidget {
  const SupportResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CustomImage(
            path: KImages.person,
            width: 32.w,
            height: 32,
            fit: BoxFit.contain,
          ),
          title: CustomText(text: 'Jonson Roy', fontWeight: FontWeight.w500),
          subtitle: CustomText(
            text: 'Support Agent',
            fontSize: 11.sp,
            color: sTextColor,
          ),
        ),
        toolbarHeight: 80,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: Utils.only(right: 20.w),
            child: PopupMenuButton(
              color: whiteColor,
              menuPadding: EdgeInsets.zero,
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: 'End',
                      child: CustomText(text: 'End Ticket'),
                    ),
                  ],
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: greyLightColor,
                  hintText: 'Order ID, product or ....',
                  hintStyle: TextStyle(color: hintTextColor, fontSize: 14.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Padding(
                    padding: Utils.all(value: 10.r),
                    child: CustomImage(
                      path: KImages.smileImoje,
                      color: hintTextColor,
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: Utils.all(value: 10.r),
                        child: CustomImage(
                          path: KImages.attach,
                          color: hintTextColor,
                        ),
                      ),
                      Padding(
                        padding: Utils.all(value: 10.r),
                        child: CustomImage(
                          path: KImages.camera,
                          color: hintTextColor,
                        ),
                      ),
                    ],
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(0.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(0.r),
                  ),
                ),
              ),
            ),
            Utils.horizontalSpace(20),
            Container(
              width: 46.w,
              height: 46,
              padding: Utils.all(value: 10.r),
              decoration: BoxDecoration(
                color: secondaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CustomImage(path: KImages.sent, width: 20, height: 20),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: Utils.symmetric(v: 6.0),
            height: 63,
            width: double.infinity,
            color: borderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Account Support',
                  fontWeight: FontWeight.w500,
                ),
                Utils.verticalSpace(10),
                Row(
                  children: [
                    CustomText(text: '#1325401'),
                    Utils.horizontalSpace(8.w),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: sTextColor.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Utils.horizontalSpace(8.w),
                    CustomText(text: '2 Days ago'),
                    Utils.horizontalSpace(8.w),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: sTextColor.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Utils.horizontalSpace(8.w),
                    Container(
                      width: 44.w,
                      height: 20,
                      padding: Utils.symmetric(h: 4.0, v: 2.0),
                      decoration: BoxDecoration(color: greenColor),
                      child: Center(
                        child: CustomText(
                          text: 'Open',
                          fontSize: 12.sp,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: const [
                ChatBubble(
                  isSender: false,
                  message:
                      "Hello, Jr Sam! Is your AC system winter-ready?\nOur Winter AC Master Cleaning and Servicing package ensures.",
                  time: "09:00 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message:
                      "Good morning. Yes, now I’m working on freelance projects",
                  time: "09:10 AM",
                ),
                ChatBubble(
                  isSender: false,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: false,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: false,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: false,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;
  final List<String>? attachments;

  const ChatBubble({
    super.key,
    required this.isSender,
    required this.message,
    required this.time,
    this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    final alignment =
        isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = isSender ? secondaryColor : const Color(0xffF8FAFC);
    final textColo = isSender ? whiteColor : textColor;
    final radius = BorderRadius.only(
      topLeft: Radius.circular(8.r),
      topRight: Radius.circular(8.r),
      bottomLeft: Radius.circular(isSender ? 8 : 0),
      bottomRight: Radius.circular(isSender ? 0 : 8),
    );

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(color: bgColor, borderRadius: radius),
          child: CustomText(text: message, color: textColo),
        ),
        if (attachments != null && attachments!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: attachments!.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          attachments![index],
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        CustomText(text: time, fontSize: 12.sp, color: sTextColor),
        const SizedBox(height: 4),
      ],
    );
  }
}
