import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: SizedBox(
        height: 132.h,
        child: CustomImage(path: KImages.bannerImage, fit: BoxFit.cover,),
      ),
    );
  }
}
