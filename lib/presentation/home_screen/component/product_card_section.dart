import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/route_names.dart';

class ProductCardSection extends StatelessWidget {
  const ProductCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    print("full height : ${size.height}");
    print("full weight : ${size.width}");
    double cardHeight;
    if (screenHeight >= 1000) {
      cardHeight = 322.0; // Extra large screens (Pixel 9 Pro XL, etc.)
    } else if (screenHeight >= 900) {
      cardHeight = 240; // Large screens (Pixel 7 Pro, Pixel 8 Pro)
    } else if (screenHeight >= 800) {
      cardHeight = 252; // Medium-Large screens
    } else if (screenHeight >= 700) {
      cardHeight = 250; // Medium screens (Most common)
    } else {
      cardHeight = 250; // Small screens (720p devices)
    }
    return SliverPadding(
      padding: Utils.symmetric(h: 17.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          mainAxisExtent: cardHeight, // Adjust height for your card
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final sale = productList[index];
          return ProductCard(item: sale);
        }, childCount: productList.length),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final InnerCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(RouteNames.productDetailsScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 68,
            child: ClipRRect(
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    CustomImage(path: item.imageUrl, fit: BoxFit.cover),
                    Positioned(
                      right: 25.w,
                      top: 6,
                      child: Container(
                        padding: Utils.all(value: 4.r),
                        width: 28.w,
                        height: 28,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: CustomImage(path: KImages.wishlistInactive),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 6,
                      child: Container(
                        padding: Utils.all(value: 0.r),
                        width: 38.w,
                        height: 18,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: CustomText(
                            text: '25%',
                            fontSize: 9.sp,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 32,
            child: Padding(
              padding: Utils.symmetric(v: 2.h, h: 0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: item.name,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    maxLine: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Utils.verticalSpace(6.0),
                  Row(
                    children: [
                      CustomImage(path: KImages.reviewStar, height: 10.h),
                      Utils.horizontalSpace(2.0),
                      CustomText(
                        text: "4.8(397) | 540 Sold",
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: sTextColor,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Utils.verticalSpace(4.0),
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
          ),
        ],
      ),
    );
  }
}
