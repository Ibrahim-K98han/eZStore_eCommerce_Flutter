import 'package:dotted_border/dotted_border.dart';
import 'package:ezstore/presentation/order_confirm/order_confirm_screen.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportTicketScreen extends StatelessWidget {
  const SupportTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Support Ticket",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 0,
        backgroundColor: secondaryColor,
        child: Icon(Icons.add, color: whiteColor),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            ),
            backgroundColor: Colors.white,
            builder: (context) {
              return SupportTicketBottomSheet();
            },
          );
        },
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SupportTicketHeader(),
              Utils.verticalSpace(16),
              PopularQuestion(),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportTicketHeader extends StatelessWidget {
  const SupportTicketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.all(value: 12.r),
      width: 343.w,
      height: 130,
      decoration: BoxDecoration(color: snowPink),
      child: Column(
        children: [
          CustomText(
            text: 'How Can we Help you?',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(4),
          CustomText(
            text: 'Type your question or search keywords',
            fontSize: 12.sp,
            color: sTextColor,
          ),
          Utils.verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                path: KImages.message,
                width: 32.w,
                height: 32,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: Utils.symmetric(h: 12.w),
                child: CustomImage(
                  path: KImages.calls,
                  width: 32.w,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              CustomImage(
                path: KImages.web,
                width: 32.w,
                height: 32,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopularQuestion extends StatelessWidget {
  const PopularQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Popular Question (FAQ)',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        Utils.verticalSpace(12),
        ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: Utils.only(bottom: 12),
              child: PopularQuestionContainer(),
            );
          },
        ),
      ],
    );
  }
}

class PopularQuestionContainer extends StatelessWidget {
  const PopularQuestionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 124,
      padding: Utils.symmetric(h: 12.0, v: 12.0),
      decoration: BoxDecoration(color: greyLightColor),
      child: Column(
        children: [
          Row(
            children: [
              CustomImage(
                path: KImages.gallery,
                width: 40.w,
                height: 40,
                fit: BoxFit.cover,
              ),
              Utils.horizontalSpace(12.w),
              CustomText(
                text: 'How can I track my order?',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Utils.verticalSpace(8),
          CustomText(
            text: 'Go to Orders → Track Order for real-time updates.',
            fontSize: 12.sp,
            color: sTextColor,
            maxLine: 1,
          ),
          Utils.verticalSpace(8),
          Row(
            children: [
              CustomText(text: 'Learn more', fontSize: 12.sp),
              Utils.horizontalSpace(4.w),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.questionScreen);
                },
                child: Icon(Icons.arrow_forward, size: 16.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SupportTicketBottomSheet extends StatefulWidget {
  const SupportTicketBottomSheet({super.key});

  @override
  State<SupportTicketBottomSheet> createState() =>
      _SupportTicketBottomSheetState();
}

class _SupportTicketBottomSheetState extends State<SupportTicketBottomSheet> {
  String selectedOrderIssue = 'late_delivery';

  final Map<String, String> orderIssues = {
    'late_delivery': 'Late Delivery',
    'wrong_item': 'Wrong Item Received',
    'damaged_product': 'Damaged Product',
    'missing_item': 'Missing Item',
    'refund_request': 'Refund Request',
    'other': 'Other Issue',
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      padding: Utils.symmetric(h: 16.0, v: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: 'Support Ticket',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Utils.verticalSpace(30),
                    Utils.horizontalLine(),
                    Utils.verticalSpace(12),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomImage(
                    path: KImages.closeIcon,
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
              ),
            ],
          ),
          CustomText(text: 'Subject'),
          Utils.verticalSpace(6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: const Color(0xffF8FAFC),
              border: Border.all(color: borderColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedOrderIssue,
                isDense: true,
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.grey.shade700,
                  size: 16.sp,
                ),
                items:
                    orderIssues.entries.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.key,
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => selectedOrderIssue = newValue);
                  }
                },
              ),
            ),
          ),
          Utils.verticalSpace(12),
          CustomFormWidget(
            label: 'Description',
            bottomSpace: 8.h,
            child: TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(
                    color: greyColor.withOpacity(0.2),
                    width: 0.5,
                  ),
                ),
                filled: true,
                fillColor: const Color(0xffF8FAFC),
                hintText: 'Enter description',
              ),
            ),
          ),
          Utils.verticalSpace(12),
          Row(
            children: [
              DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: [2, 5],
                  color: greyColor,
                  padding: Utils.symmetric(h: 12.w, v: 8.h),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImage(
                      path: KImages.imageAdd,
                      width: 20.w,
                      height: 20,
                    ),
                    Utils.horizontalSpace(8.w),
                    CustomText(
                      text: 'Choose File',
                      decoration: TextDecoration.underline,
                    ),
                  ],
                ),
              ),
              Utils.horizontalSpace(10.w),
              CustomText(text: 'Screenshot.jpg', color: sTextColor),
            ],
          ),
          Utils.verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 150.w,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                  ),
                  child: Center(child: CustomText(text: 'Cancel')),
                ),
              ),
              Utils.horizontalSpace(20.w),
              Expanded(
                child: PrimaryButton(
                  bgColor: secondaryColor,
                  borderRadiusSize: 0.0,
                  minimumSize: Size(150.w, 44),
                  text: 'Submit',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.mySupportTicketScreen,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
