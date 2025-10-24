import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/k_images.dart';
import 'component/profile_menu_item.dart';
import 'component/setting_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 120.h),
        child: SettingAppBar(),
      ),

      body: Padding(
        padding: Utils.symmetric(h: 16.w, v: 12.h),
        child: Column(
          children: [
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.myProfileScreen);
              },
              img: KImages.users,
              text: 'My Profile',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.shippingAddressScreen);
              },
              img: KImages.location,
              text: 'Shipping Address',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.myReviewScreen);
              },
              img: KImages.myReview,
              text: 'My Review',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.inviteFriend,
              text: 'Invite Friends',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.languageScreen);
              },
              img: KImages.languages,
              text: 'Language',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.currencyScreen);
              },
              img: KImages.currency,
              text: 'Currency',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.notificationSettingsScreen,
                );
              },
              img: KImages.notificationss,
              text: 'Notification Settings',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.rateEzstore,
              text: 'Rate eZsote',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.deviceManagerScreen);
              },
              img: KImages.deviceManagement,
              text: 'Device Management',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.changePasswordScreen);
              },
              img: KImages.passwordChange,
              text: 'Password Change',
            ),
            ProfileMenuItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.accountDeleteScreen);
              },
              img: KImages.deleteAccount,
              text: 'Delete Account',
            ),
            ProfileMenuItem(
              onTap: () {},
              img: KImages.logouts,
              text: 'Logout',
              textColor: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
