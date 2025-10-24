import 'package:ezstore/presentation/profile_screen/component/profile_menu_item.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/utils.dart';
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
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.couponsScreen);
              },
              img: KImages.coupon,
              text: 'Coupons',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.giftAndWalletScreen);
              },
              img: KImages.gift,
              text: 'Wallet & Gift Card',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.historyScreen);
              },
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
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.supportTicketScreen);
              },
              img: KImages.support,
              text: 'Support Ticket',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.shippingMethodScreen);
              },
              img: KImages.support,
              text: 'Shipping Method',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.shippingAddressScreen);
              },
              img: KImages.support,
              text: 'Shipping Address',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.termsAndConditionScreen);
              },
              img: KImages.termsAndCondition,
              text: 'Terms & Condition',
            ),

            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.privacyPolicyScreen);
              },
              img: KImages.privacyPolicy,
              text: 'Privacy Policy',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(RouteNames.appInfoScreen);
              },
              img: KImages.appInfos,
              text: 'App info',
            ),
            Utils.verticalSpace(70),
          ],
        ),
      ),
    );
  }
}
