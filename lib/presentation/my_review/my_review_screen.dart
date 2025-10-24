import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyReviewScreen extends StatelessWidget {
  const MyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "My Reviews",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ReviewWidget();
          },
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              path: KImages.product1,
              width: 66.w,
              height: 66.h,
              fit: BoxFit.cover,
            ),
            Utils.horizontalSpace(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Vibrant Sunset Maxi Dress',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Utils.verticalSpace(8.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          CustomText(text: 'Color: ', fontSize: 11.sp),
                          CustomText(
                            text: 'Gray',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Utils.horizontalSpace(10.w),
                      Row(
                        children: [
                          CustomText(text: 'Size: ', fontSize: 11.sp),
                          CustomText(
                            text: "M",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Utils.verticalSpace(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: '\$59.99 ',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(text: 'x 1', fontSize: 12.sp),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '5',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomImage(
                            path: KImages.reviewStar,
                            width: 16.w,
                            height: 16,
                          ),
                          Utils.horizontalSpace(4.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.writeReviewScreen,
                              );
                            },
                            child: Container(
                              width: 44.w,
                              height: 22,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: borderColor,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Edit',
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Utils.verticalSpace(12),
      ],
    );
  }
}
