import 'package:ezstore/presentation/profile_screen/component/profile_appbar.dart';
import 'package:flutter/material.dart';

import 'component/discount_banner.dart';
import 'component/my_order_widget.dart';
import 'component/profile_menu.dart';

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
            colors: [Color(0xFFFFF5F6), Color(0xFFFAF9F9)],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            ProfileAppbar(),
            MyOrdersWidget(),
            DiscountBanner(),
            ProfileMenu(),
          ],
        ),
      ),
    );
  }
}
