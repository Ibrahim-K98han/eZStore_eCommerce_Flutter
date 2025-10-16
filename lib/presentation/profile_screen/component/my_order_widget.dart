import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';
import 'my_order_single_widget.dart';

class MyOrdersWidget extends StatelessWidget {
  const MyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Utils.symmetric(v: 0.h),
        child: Container(
          padding: Utils.symmetric(h: 10.w, v: 10.h),
          decoration: BoxDecoration(color: whiteColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'My Orders',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'View All',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      Utils.horizontalSpace(6.w),
                      Icon(Icons.arrow_forward_ios, size: 14.sp),
                    ],
                  ),
                ],
              ),
              Utils.verticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyOrderSingleWidget(img: KImages.toPay, text: 'To Pay'),
                  MyOrderSingleWidget(img: KImages.toShip, text: 'To Ship'),
                  MyOrderSingleWidget(img: KImages.shipped, text: 'Shipped'),
                  MyOrderSingleWidget(img: KImages.toReview, text: 'To Review'),
                  MyOrderSingleWidget(img: KImages.returan, text: 'Return'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
