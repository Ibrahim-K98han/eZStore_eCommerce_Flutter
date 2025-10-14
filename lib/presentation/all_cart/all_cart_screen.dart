import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_app_bar.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCartScreen extends StatefulWidget {
  const AllCartScreen({super.key});

  @override
  State<AllCartScreen> createState() => _AllCartScreenState();
}

class _AllCartScreenState extends State<AllCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'All Carts',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: CustomImage(path: KImages.horizontalDot),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 96.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // shadow color
              offset: Offset(0, -4), // vertical offset: negative for top
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomText(
                    text: '\$79.99',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Utils.horizontalSpace(6.w),
                  CustomText(
                    text: '\$98.99',
                    fontSize: 12.sp,
                    color: greyColor.withOpacity(0.4),
                    decoration: TextDecoration.lineThrough,
                  ),
                ],
              ),
            ),
            Expanded(
              child: PrimaryButton(
                minimumSize: Size(160.w, 44.h),
                borderRadiusSize: 0.r,
                text: 'Checkout(3)',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.orderConfirmScreen);
                },
              ),
            ),
          ],
        ),
      ),

      body: ListView.builder(
        padding: Utils.symmetric(h: 20.w, v: 10.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CartWidget(),
          );
        },
      ),
    );
  }
}

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  String selectedColor = 'Gray';

  final Map<String, Color> colors = {
    'Gray': Colors.grey.shade400,
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 14.w,
          height: 14.h,
          decoration: BoxDecoration(
            border: Border.all(color: textColor.withOpacity(0.5)),
            shape: BoxShape.circle,
          ),
        ),
        Utils.horizontalSpace(12.w),
        CustomImage(
          path: KImages.detailsImgOne,
          width: 72.w,
          height: 72.h,
          fit: BoxFit.cover,
        ),
        Utils.horizontalSpace(10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Vibrant Sunset Maxi Dress',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: Color(0xffF8FAFC),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                       padding: Utils.symmetric(v: 2.h,h: 4.w),
                        value: selectedColor,
                        isDense: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16.sp,
                        ),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() => selectedColor = newValue);
                          }
                        },
                        items:
                            colors.keys.map((String colorName) {
                              return DropdownMenuItem<String>(
                                value: colorName,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10.r,
                                      backgroundColor: colors[colorName],
                                    ),
                                    const SizedBox(width: 4),
                                    Text(colorName),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  Utils.horizontalSpace(8.w),
                  CustomText(text: 'M'),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // spread price & qty
                children: [
                  // Price info
                  Row(
                    children: [
                      CustomText(
                        text: '\$79.99',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Utils.horizontalSpace(6.w),
                      CustomText(
                        text: '\$98.99',
                        fontSize: 12.sp,
                        color: greyColor.withOpacity(0.4),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ],
                  ),
                  // Trash + Qty + Plus aligned right
                  Row(
                    children: [
                      Container(
                        padding: Utils.symmetric(h: 6.w, v: 6.h),
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.1),
                          border: Border.all(color: textColor.withOpacity(0.2)),
                        ),
                        child: CustomImage(path: KImages.trash),
                      ),
                      Container(
                        padding: Utils.symmetric(h: 12.w, v: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: textColor.withOpacity(0.2)),
                        ),
                        child: CustomText(text: '1', fontSize: 10.sp),
                      ),
                      Container(
                        padding: Utils.symmetric(h: 6.w, v: 6.h),
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.1),
                          border: Border.all(color: textColor.withOpacity(0.2)),
                        ),
                        child: CustomImage(path: KImages.plus),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
