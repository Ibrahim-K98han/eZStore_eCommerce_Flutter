import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_app_bar.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/route_names.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // 👈 increase AppBar height for top padding
        titleSpacing: 0, // optional: remove default side spacing
        backgroundColor: Colors.white, // optional: customize background
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0), // 👈 top padding for title
          child: CustomText(
            text: "WishList",
            fontSize: 16.sp, // optional: style customization
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(RouteNames.wishlistWithSelectScreen);
            },
            child: Padding(
              padding: Utils.only(
                right: 16.w,
                top: 12.0,
              ), // 👈 match top padding
              child: CustomImage(
                path: KImages.listviewRectangle,
                height: 24, // optional: control icon size
                width: 24,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: Utils.symmetric(h: 16.0),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: Utils.only(bottom: 12.h),
                  child: WishListCard(
                    wishList: wishlist[index],
                    onFavoriteToggle: () {
                      setState(() {
                        wishlist[index].isFavorite =
                            !wishlist[index].isFavorite;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  final WishList wishList;
  final VoidCallback onFavoriteToggle;

  const WishListCard({
    Key? key,
    required this.wishList,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CustomImage(
              path: wishList.image,
              width: 76.w,
              height: 76.h,
              fit: BoxFit.cover,
            ),

            Positioned(
              top: 4.0,
              left: 4.0,
              child: Container(
                padding: Utils.symmetric(h: 4.w, v: 0.h),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: CustomText(
                  text: '${wishList.discount}%',
                  fontSize: 8.sp,
                  color: whiteColor,
                ),
              ),
            ),
            // Favorite Heart
            Positioned(
              top: 4.h,
              right: 4.w,
              child: GestureDetector(
                onTap: onFavoriteToggle,
                child: Container(
                  padding: Utils.all(value: 3.r),
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: CustomImage(
                    path: KImages.wishlistFill,
                    width: 10.w,
                    height: 10.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        Utils.horizontalSpace(12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: wishList.name,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                height: 1.2,
                maxLine: 1,
              ),
              Utils.verticalSpace(4.h),
              Row(
                children: [
                  CustomText(
                    text: '\$${wishList.price.toStringAsFixed(2)}',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Utils.horizontalSpace(4.w),
                  CustomText(
                    text: '\$${wishList.originalPrice.toStringAsFixed(2)}',
                    fontSize: 10.sp,
                    color: sTextColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ],
              ),
              Utils.verticalSpace(4.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 14.sp),
                  Utils.horizontalSpace(4.w),
                  CustomText(
                    text: '${wishList.rating}',
                    fontSize: 10.sp,
                    color: sTextColor,
                  ),

                  CustomText(
                    text: ' (${wishList.reviewCount})',
                    fontSize: 10.sp,
                    color: sTextColor,
                  ),
                  Utils.horizontalSpace(4.w),

                  CustomText(
                    text: '${wishList.soldCount} Sold',
                    fontSize: 10.sp,
                    color: sTextColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Cart Button
        Container(
          width: 32.w,
          height: 32.h,
          margin: Utils.only(top: 20.h),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: IconButton(
            icon: Icon(Icons.shopping_cart_checkout_sharp, size: 16.sp),
            onPressed: () {},
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
