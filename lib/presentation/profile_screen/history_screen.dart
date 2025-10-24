import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Browsing History",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: Utils.only(right: 20.w),
            child: CustomImage(path: KImages.filter),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: whiteColor,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: Utils.symmetric(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 18.w,
                    height: 18,
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Utils.horizontalSpace(8.w),
                  CustomText(text: 'All', fontSize: 12.sp),
                ],
              ),
              CustomText(
                text: 'Delete(5)',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HistoryData(title: '6 October'),
              HistoryData(title: '4 October'),
              HistoryData(title: '26 September'),
              HistoryData(title: '19 September'),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryData extends StatelessWidget {
  const HistoryData({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 18.w,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                shape: BoxShape.circle,
              ),
            ),
            Utils.horizontalSpace(4.w),
            CustomText(text: title, fontWeight: FontWeight.w500),
          ],
        ),
        Utils.verticalSpace(10),
        SizedBox(
          height: 185,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: Utils.only(right: 8.w),
                child: HistoryCardWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      width: 109.w,
      child: Column(
        children: [
          Stack(
            children: [
              CustomImage(
                path: KImages.product1,
                width: 109.w,
                height: 109,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: Utils.all(value: 6.r),
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: CustomImage(
                    path: KImages.shoppingCarts,
                    width: 14,
                    height: 14,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: Utils.symmetric(v: 2.h, h: 0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: 'Vibrant Sunset Maxi Dress',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  maxLine: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                Utils.verticalSpace(6.0),
                Row(
                  children: [
                    CustomText(
                      text: "\$59.99",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Utils.horizontalSpace(8.w),
                    CustomText(
                      text: "\$59.99",
                      color: Color(0xFF9CA3AF),
                      fontSize: 9.sp,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
