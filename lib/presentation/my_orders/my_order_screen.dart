import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Data/dummy_data.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_image.dart';
import 'component/category_widget.dart';
import 'component/order_item_widget.dart';

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

