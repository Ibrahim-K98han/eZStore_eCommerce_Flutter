import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../all_cart/all_cart_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // 👈 increase AppBar height for top padding
        titleSpacing: 0,   // optional: remove default side spacing
        backgroundColor: Colors.white, // optional: customize background
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0), // 👈 top padding for title
          child: CustomText(
            text: "All Carts",
            fontSize: 16.sp, // optional: style customization
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(RouteNames.allCartScreen);
            },
            child: Padding(
              padding: Utils.only(right: 16.w, top: 12.0),// 👈 match top padding
              child: CustomImage(
                path: KImages.listviewRectangle,
                height: 24, // optional: control icon size
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: Utils.symmetric(h: 16.w, v: 0.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: CartCard(),
          );
        },
      ),
    );
  }
}

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
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
    return SizedBox(
      width: 80.w,
      height: 82.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            path: KImages.detailsImgOne,
            width: 80.w,
            height: double.infinity,
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: Color(0xffF8FAFC),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: Utils.symmetric(v: 2.h,h: 2.w),
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
                    Utils.horizontalSpace(6.w),
                    CustomText(text: 'M'),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // spread price & qty
                  children: [
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
                          height: 28.h,
                          width: 28.h,
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.1),
                            border: Border.all(color: textColor.withOpacity(0.2)),
                          ),
                          child: Center(child: CustomImage(path: KImages.trash, height: 14.h,)),
                        ),
                        Container(
                          height: 28.h,
                          width: 28.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: textColor.withOpacity(0.2)),
                          ),
                          child: Center(child: CustomText(text: '1', fontSize: 12.sp)),
                        ),
                        Container(
                          height: 28.h,
                          width: 28.h,
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.1),
                            border: Border.all(color: textColor.withOpacity(0.2)),
                          ),
                          child: Center(child: CustomImage(path: KImages.plus, height: 16.h)),
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
    );
  }
}
