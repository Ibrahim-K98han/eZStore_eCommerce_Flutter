import 'package:dotted_border/dotted_border.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Write Review",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 96.h,
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
        child: Padding(
          padding: Utils.symmetric(v: 23.h),
          child: PrimaryButton(
            bgColor: secondaryColor,
            minimumSize: Size(double.infinity, 44.h),
            borderRadiusSize: 0.0,
            text: 'Rate now',
            onPressed: () {},
          ),
        ),
      ),
      body: WriteReviewData(),
    );
  }
}

class WriteReviewData extends StatelessWidget {
  const WriteReviewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                path: KImages.product1,
                width: 56.w,
                height: 56.h,
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
                  ],
                ),
              ),
            ],
          ),
          Utils.verticalSpace(20.h),
          RatingWidgets(title: 'Overall Rating'),
          Utils.verticalSpace(6.h),
          RatingWidgets(title: 'Product Quality'),
          Utils.verticalSpace(6.h),
          RatingWidgets(title: 'Shipping Service'),
          Utils.verticalSpace(20.h),
          CustomFormWidget(
            label: 'Please write a feedback least 20 characters',
            bottomSpace: 12.sp,
            child: TextFormField(
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
                hintText: 'What do you think of the quality',
              ),
              maxLines: 2,
            ),
          ),
          Utils.verticalSpace(16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Upload photos/Video'),
              Utils.verticalSpace(8.h),
              DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: [2, 5],
                  color: greyColor,
                  padding: Utils.symmetric(h: 12.w, v: 20.h),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImage(path: KImages.camera),
                    Utils.verticalSpace(4.h),
                    CustomText(
                      text: 'Upload\nphotos/Video',
                      textAlign: TextAlign.center,
                      color: greyColor,
                    ),
                  ],
                ),
              ),
              Utils.verticalSpace(16.h),
              Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: greyColor),
                    ),
                  ),
                  Utils.horizontalSpace(8.w),
                  CustomText(
                    text: 'Anonymously',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RatingWidgets extends StatelessWidget {
  const RatingWidgets({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, fontSize: 12.sp, fontWeight: FontWeight.w500),
        RatingBar(
          itemPadding: EdgeInsets.zero,
          initialRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: 18.sp,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: const Icon(Icons.star_rate_rounded, color: Colors.amber),
            half: const Icon(Icons.star_rate_rounded, color: Colors.amber),
            empty: Icon(
              Icons.star_rate_rounded,
              color: greyColor.withOpacity(0.1),
            ),
          ),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
