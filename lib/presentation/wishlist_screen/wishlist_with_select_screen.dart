
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
import '../../widgets/primary_button.dart';

class WishlistWithSelectScreen extends StatefulWidget {
  const WishlistWithSelectScreen({super.key});

  @override
  State<WishlistWithSelectScreen> createState() =>
      _WishlistWithSelectScreenState();
}

class _WishlistWithSelectScreenState extends State<WishlistWithSelectScreen> {
  // Track selected items
  Map<int, bool> selectedItems = {};

  @override
  void initState() {
    super.initState();
    // Initialize all items as unselected
    for (int i = 0; i < wishlist.length; i++) {
      selectedItems[i] = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wishlist',
        visibleLeading: true,
        titleCenter: true,
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: 'Total \$ 369.00',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: '(5 Products)',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: sTextColor,
                ),
              ],
            ),
            PrimaryButton(
              minimumSize: Size(160.w, 44.h),
              borderRadiusSize: 0.r,
              text: 'Add to Cart',
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.allCartScreen);
              },
            ),
          ],
        ),
      ),
      body: wishlist.isEmpty
          ? Center(
        child: CustomText(
          text: 'No items in wishlist',
          fontSize: 16.sp,
          color: sTextColor,
        ),
      )
          : ListView.builder(
        padding: Utils.symmetric(),
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: Utils.only(bottom: 12.h),
            child: WishListCard(
              wishList: wishlist[index],
              isSelected: selectedItems[index] ?? false,
              onSelectToggle: () {
                setState(() {
                  selectedItems[index] = !(selectedItems[index] ?? false);
                });
              },
              onFavoriteToggle: () {
                setState(() {
                  wishlist[index].isFavorite = !wishlist[index].isFavorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  final WishList wishList;
  final bool isSelected;
  final VoidCallback onSelectToggle;
  final VoidCallback onFavoriteToggle;

  const WishListCard({
    Key? key,
    required this.wishList,
    required this.isSelected,
    required this.onSelectToggle,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Checkbox/Selection Circle
            GestureDetector(
              onTap: onSelectToggle,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? Colors.black : Color(0xFFCBD5E1), width: 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: isSelected
                    ? Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14.sp,
                )
                    : null,
              ),
            ),
            Utils.horizontalSpace(13.w),
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
              Utils.verticalSpace(2.h),
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
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}