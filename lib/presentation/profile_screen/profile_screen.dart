import 'package:ezstore/presentation/profile_screen/component/profile_appbar.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF5F6), // light pink
              Color(0xFFFAF9F9), // soft peach
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            ProfileAppbar(),
            SliverToBoxAdapter(child: MyOrdersWidget()),
          ],
        ),
      ),
    );
  }
}

class MyOrdersWidget extends StatelessWidget {
  const MyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(v: 10.h),
      child: Container(
        padding: Utils.symmetric(h: 12.w, v: 12.h),
        decoration: BoxDecoration(color: whiteColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'My Orders',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'View All',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                    Utils.horizontalSpace(6.w),
                    Icon(Icons.arrow_forward_ios, size: 14.sp),
                  ],
                ),
              ],
            ),
            Utils.verticalSpace(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyOrderWidget(img: KImages.toPay, text: 'To Pay'),
                MyOrderWidget(img: KImages.toShip, text: 'To Ship'),
                MyOrderWidget(img: KImages.shipped, text: 'Shipped'),
                MyOrderWidget(img: KImages.toReview, text: 'To Review'),
                MyOrderWidget(img: KImages.returan, text: 'Return'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyOrderWidget extends StatelessWidget {
  const MyOrderWidget({super.key, required this.img, required this.text});

  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(path: img, width: 20.w, height: 20.h, fit: BoxFit.cover),
        Utils.verticalSpace(4.h),
        CustomText(text: text),
      ],
    );
  }
}
