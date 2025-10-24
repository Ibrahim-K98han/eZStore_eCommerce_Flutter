import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Shipping Address",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
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
            text: 'Add new Address',
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.addNewShippingAddressScreen,
              );
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: Utils.symmetric(h: 16.w, v: 8.h),
            child: ShippingAddressWidget(),
          );
        },
      ),
    );
  }
}

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.w, v: 6.h),
      decoration: BoxDecoration(color: greyLightColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Default',
                fontSize: 9.sp,
                color: secondaryColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.addNewShippingAddressScreen,
                  );
                },
                child: CustomText(
                  text: 'Edit',
                  fontSize: 12.sp,
                  color: blueColor,
                ),
              ),
            ],
          ),
          CustomText(
            text: 'Jonson Roy #0154',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(4.h),
          CustomText(
            text: '+880 16890 91933',
            fontSize: 12.sp,
            color: sTextColor,
          ),
          Utils.verticalSpace(4.h),
          CustomText(
            text: 'House-8, Road-7, Block-A, Dhaka-1216',
            fontSize: 12.sp,
            color: sTextColor,
          ),
        ],
      ),
    );
  }
}
