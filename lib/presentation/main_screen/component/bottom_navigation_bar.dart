import 'package:ezstore/presentation/category_screen/category_screen.dart';
import 'package:ezstore/presentation/home_screen/home_screen.dart';
import 'package:ezstore/presentation/profile_screen/profile_screen.dart';
import 'package:ezstore/presentation/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/k_images.dart';
import '../../../utils/constraints.dart';
import 'main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final MainController controller;

  const MyBottomNavigationBar({super.key, required this.controller});

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const HomeScreen(), // Replace with your actual screen
      item: ItemConfig(
        icon: SvgPicture.asset(KImages.homeActive),
        title: "Home",
        inactiveIcon: SvgPicture.asset(KImages.homeInactive),
        iconSize: 22.h,
        activeForegroundColor: Colors.black,
        inactiveForegroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    ),
    PersistentTabConfig(
      screen: const CategoryScreen(), // Replace with your actual screen
      item: ItemConfig(
        icon: SvgPicture.asset(KImages.categoryActive),
        title: "Category",
        inactiveIcon: SvgPicture.asset(KImages.categoryInactive),
        iconSize: 22.h,
        activeForegroundColor: Colors.black,
        inactiveForegroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    ),
    PersistentTabConfig(
      screen: const CategoryScreen(), // Replace with your actual screen
      item: ItemConfig(
        icon: SvgPicture.asset(KImages.cart),
        // title: "Category",
        inactiveIcon: SvgPicture.asset(KImages.cart),
        iconSize: 24.h,
        activeForegroundColor: Color(0xFFE43131),
      ),
    ),
    PersistentTabConfig(
      screen: const WishlistScreen(), // Replace with your actual screen
      item: ItemConfig(
        icon: SvgPicture.asset(KImages.wishlistActive),
        title: "Wishlist",
        inactiveIcon: SvgPicture.asset(KImages.wishlistInactive),
        iconSize: 22.h,
        activeForegroundColor: Colors.black,
        inactiveForegroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    ),
    PersistentTabConfig(
      screen: const ProfileScreen(), // Replace with your actual screen
      item: ItemConfig(
        icon: SvgPicture.asset(KImages.profileActive),
        title: "Profile",
        inactiveIcon: SvgPicture.asset(KImages.profileInactive),
        iconSize: 22.h,
        activeForegroundColor: Colors.black,
        inactiveForegroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder:
          (navBarConfig) => Style13BottomNavBar(
            navBarConfig: navBarConfig,
            middleItemSize: 50.h,
            height: 60.h,
            navBarDecoration: NavBarDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
            ),
          ),
    );
  }
}
