import 'dart:io';

import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import 'main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final MainController controller;

  const MyBottomNavigationBar({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: controller.naveListener.stream,
      builder: (context, snapshot) {
        final selectedIndex = snapshot.data ?? 0;
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: whiteColor,
          elevation: 8,
          child: Container(
            color: Colors.transparent,
            height: Platform.isAndroid ? 100 : 110,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _navButton(
                      KImages.homeInactive,
                      'Home',
                      KImages.homeActive,
                      0,
                      selectedIndex,
                    ),
                    SizedBox(width: 30.w),
                    _navButton(
                      KImages.categoryInactive,
                      'Category',
                      KImages.categoryActive,
                      1,
                      selectedIndex,
                    ),
                  ],
                ),
                // Right Side Icons
                Row(
                  children: [
                    _navButton(
                      KImages.wishlistInactive,
                      'Wishlist',
                      KImages.wishlistActive,
                      3,
                      selectedIndex,
                    ),
                    SizedBox(width: 30.w),
                    _navButton(
                      KImages.profileInactive,
                      'Profile',
                      KImages.profileActive,
                      4,
                      selectedIndex,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navButton(
    String icon,
    String text,
    String activeIcon,
    int index,
    int selectedIndex,
  ) {
    return GestureDetector(
      onTap: () => controller.changeNav(index),
      child: Column(
        children: [
          SvgPicture.asset(
            selectedIndex == index ? activeIcon : icon,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),
          CustomText(
            text: text,
            color:
                selectedIndex == index ? Color(0xff111827) : Color(0xff334155),
          ),
        ],
      ),
    );
  }
}
