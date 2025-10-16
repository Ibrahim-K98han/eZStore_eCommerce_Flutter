import 'package:ezstore/utils/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Data/dummy_data.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_form.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../home_screen/component/category.dart';
import 'component/category_widget.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 16.w,
                  ),
                  prefixIcon: Padding(
                    padding: Utils.all(value: 10.r),
                    child: CustomImage(
                      path: KImages.search,
                      color: borderColor,
                    ),
                  ),
                  hintText: 'Order ID, product or store...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
              ),
            ),
            Utils.horizontalSpace(10.w),
            CustomImage(path: KImages.filter, width: 20.w, height: 20.h),
            CustomImage(path: KImages.headphone, width: 20.w, height: 20.h),
            CustomImage(path: KImages.trash, width: 20.w, height: 20.h),
          ],
        ),
      ),
      body: Column(
        children: [
          CategoryWidget(),
          Expanded(
            child: ListView.builder(
              padding: Utils.symmetric(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderItemWidget(order: orders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({super.key, required this.order});

  final OrderItem order;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Utils.verticalSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: widget.order.status, fontWeight: FontWeight.w500),
            CustomText(
              text: widget.order.date,
              fontSize: 12.sp,
              color: sTextColor,
            ),
          ],
        ),
        Utils.verticalSpace(8.h),
        Utils.horizontalLine(),
        Utils.verticalSpace(12.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              path: widget.order.image,
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
                    text: widget.order.productName,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          CustomText(text: 'Color: ', fontSize: 11.sp),
                          CustomText(
                            text: widget.order.color,
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
                            text: widget.order.size,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: '\$${widget.order.price.toStringAsFixed(2)}',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: 'x${widget.order.quantity}',
                        fontSize: 12.sp,
                        color: textColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Utils.verticalSpace(12.h),
        Container(
          padding: Utils.symmetric(h: 12.w, v: 8.h),
          decoration: BoxDecoration(
              color: greyLightColor
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomImage(
                          path: KImages.deliverTruck,
                          width: 18.w,
                          height: 18.h,
                        ),
                        Utils.horizontalSpace(6.w),
                        CustomText(text: widget.order.trackingText),
                      ],
                    ),

                    CustomText(
                        text:
                        'Estimated delivery: ${widget.order.estimatedDelivery}',
                        fontSize: 11.sp,
                        color: sTextColor ,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16.sp, color: textLightColor),
            ],
          ),
        ),
      ],
    );
  }
}
