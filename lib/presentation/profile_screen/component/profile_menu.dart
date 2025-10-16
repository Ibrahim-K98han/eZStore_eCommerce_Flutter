import 'package:ezstore/presentation/profile_screen/component/profile_menu_item.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/k_images.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            ProfileMenuItem(
              onTap: () {},
              img: KImages.payment,
              text: 'Payment',
            ),
            ProfileMenuItem(onTap: () {}, img: KImages.coupon, text: 'Coupons'),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.gift,
              text: 'Wallet & Gift Card',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.history,
              text: 'History',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.myOrderScreen);
              },
              img: KImages.history,
              text: 'My Orders',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.support,
              text: 'Support Ticket',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.termsAndCondition,
              text: 'Terms & Condition',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.privacyPolicy,
              text: 'Privacy Policy',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.appInfos,
              text: 'App info',
            ),
          ],
        ),
      ),
    );
  }
}
