import 'package:ezstore/presentation/home_screen/component/banner_section.dart';
import 'package:ezstore/presentation/home_screen/component/flash_sale_section.dart';
import 'package:ezstore/presentation/home_screen/component/home_app_bar.dart';
import 'package:ezstore/presentation/home_screen/component/hot_sale_section.dart';
import 'package:ezstore/presentation/home_screen/component/inner_category.dart';
import 'package:ezstore/presentation/home_screen/component/product_card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../../widgets/custom_text.dart';
import 'component/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(slivers:
      [
        HomeAppBar(),
        Category(),
        BannerSection(),
        InnerCategory(),
        FlashSaleSection(),
        HotSaleSection(),
        SliverToBoxAdapter(child: Utils.verticalSpace(10.h)),
        SliverToBoxAdapter(child: Center(child: CustomText(text: "Only For You", fontSize: 12.sp,fontWeight: FontWeight.w600))),
        SliverToBoxAdapter(child: Utils.verticalSpace(8.h)),
        ProductCardSection(),
        SliverToBoxAdapter(child: Utils.verticalSpace(80.h)),
      ]),
    );
  }
}
