import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingMethodScreen extends StatefulWidget {
  const ShippingMethodScreen({super.key});

  @override
  State<ShippingMethodScreen> createState() => _ShippingMethodScreenState();
}

class _ShippingMethodScreenState extends State<ShippingMethodScreen> {
  // Track selected items
  Map<int, bool> selectedItems = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < shippingAddressList.length; i++) {
      selectedItems[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Shipping Method",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: shippingAddressList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: Utils.symmetric(h: 16.w, v: 8.h),
            child: ShippingMethodWidget(
              shippingAddress: shippingAddressList[index],
              isSelected: selectedItems[index] ?? false,
              onSelectedToggle: () {
                setState(() {
                  for (int i = 0; i < selectedItems.length; i++) {
                    selectedItems[i] = i == index;
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class ShippingMethodWidget extends StatelessWidget {
  const ShippingMethodWidget({
    super.key,
    required this.shippingAddress,
    required this.onSelectedToggle,
    required this.isSelected,
  });

  final ShippingAddressList shippingAddress;
  final VoidCallback onSelectedToggle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.w, v: 12.h),
      decoration: BoxDecoration(color: greyLightColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(text: 'Shipping: ', fontSize: 12.sp),
                  CustomText(
                    text: shippingAddress.shippingAmount,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              GestureDetector(
                onTap: onSelectedToggle,
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: isSelected ? secondaryColor : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? secondaryColor : Color(0xFFCBD5E1),
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child:
                      isSelected
                          ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                          : null,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(4.h),
          Row(
            children: [
              CustomText(text: 'Delivery: ', fontSize: 12.sp),
              CustomText(
                text: shippingAddress.deliveryDate,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Utils.verticalSpace(4.h),
          CustomText(text: shippingAddress.transitionRoute, fontSize: 12.sp),
          Utils.verticalSpace(8.h),
          Container(
            width: 150.w,
            height: 27.h,
            padding: Utils.only(left: 4.w, right: 4.w),
            decoration: BoxDecoration(color: whiteColor),
            child: Center(
              child: CustomText(text: 'Tracking Unavailable', fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
