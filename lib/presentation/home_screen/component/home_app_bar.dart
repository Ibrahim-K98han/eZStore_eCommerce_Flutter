import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    double cardHeight;
    if (screenHeight >= 1000) {
      cardHeight = 150.h; // Extra large screens (Pixel 9 Pro XL, etc.)
    } else if (screenHeight >= 900) {
      cardHeight = 146.h; // Large screens (Pixel 7 Pro, Pixel 8 Pro)
    } else if (screenHeight >= 800) {
      cardHeight = 158.h; // Medium-Large screens
    } else if (screenHeight >= 700) {
      cardHeight = 140.h; // Medium screens (Most common)
    } else {
      cardHeight = 140.h; // Small screens (720p devices)
    }
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: Utils.vSize(cardHeight),
      backgroundColor: transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFFEFE), Color(0xFFFCE7E7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Positioned Profile + Location + Icons Row
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _borderContainer(
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CustomImage(
                          path: KImages.person,
                          fit: BoxFit.cover,
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Hi, Alex Palu',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: '2464 Royal Ln. ',
                              fontSize: 12.0,
                              color: textColor,
                            ),
                            Icon(Icons.keyboard_arrow_down, color: textColor),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed(RouteNames.notificationScreen);
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {},
                    badgeContent: CustomText(
                      text: '1',
                      color: whiteColor,
                      fontSize: 12.sp,
                    ),
                    badgeAnimation: badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),

                    child: CustomImage(path: KImages.notificationss),
                  ),

                  // _borderContainer(
                  //   const CustomImage(path: KImages.notification, height: 26.0),
                  // ),
                ),
              ],
            ),
          ),

          // Positioned Search Bar
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,
            child: GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.searchScreen);
              },
              child: Container(
                height: 44.h,
                padding: Utils.symmetric(h: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99.0),
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: Utils.symmetric(h: 10.w),
                      child: CustomText(
                        text: "Search Products...",
                        color: Color(0xFFCBD5E1),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImage(
                          path: KImages.camera,
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.cover,
                        ),
                        Utils.horizontalSpace(12.w),
                        Container(
                          width: 50.w,
                          height: 36.h,
                          padding: Utils.symmetric(h: 10.w, v: 8.h),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                          child: CustomImage(
                            path: KImages.search,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _borderContainer(Widget child) {
    return Container(
      height: Utils.vSize(46.0),
      width: Utils.vSize(46.0),
      margin: Utils.only(left: 0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: whiteColor.withOpacity(0.3), width: 1.0),
        borderRadius: Utils.borderRadius(),
      ),
      child: child,
    );
  }
}
