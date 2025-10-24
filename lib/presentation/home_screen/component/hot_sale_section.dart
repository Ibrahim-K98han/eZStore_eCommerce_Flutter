import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/route_names.dart';

class HotSaleSection extends StatelessWidget {
  const HotSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: Utils.symmetric(h: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.43,
                padding: Utils.symmetric(h: 7.w, v: 8.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFE6E6), Color(0xFFFFFAFA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(text: "Hot", fontWeight: FontWeight.w600, fontSize: 12.sp,),
                            CustomImage(path: KImages.hot, height: 12.h,),
                            CustomText(text: "Sale", fontWeight: FontWeight.w600, fontSize: 12.sp,),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(text: "More",fontWeight: FontWeight.w500, fontSize: 10.sp,),
                            Utils.horizontalSpace(4.w),
                            CustomImage(path: KImages.arrowRight),
                          ],
                        ),
                      ],
                    ),
                    Utils.verticalSpace(10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(hotSale.length, (index) {
                          final sale = hotSale[index];
                          return HotSaleCard(item: sale,);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
               Utils.horizontalSpace(8.w),

              Container(
                width: size.width * 0.43,
                padding: Utils.symmetric(h: 7.w, v: 8.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFFDE6), Color(0xFFFEFEF3)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(text: "Hot", fontWeight: FontWeight.w600, fontSize: 12.sp,),
                            CustomImage(path: KImages.hot, height: 12.h,),
                            CustomText(text: "Sale", fontWeight: FontWeight.w600, fontSize: 12.sp,),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(text: "More",fontWeight: FontWeight.w500, fontSize: 10.sp,),
                            Utils.horizontalSpace(4.w),
                            CustomImage(path: KImages.arrowRight),
                          ],
                        ),
                      ],
                    ),
                    Utils.verticalSpace(10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(hotSale.length, (index) {
                          final sale = hotSale[index];
                          return HotSaleCard(item: sale,);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotSaleCard extends StatelessWidget {
  const HotSaleCard({super.key, required this.item});

  final InnerCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.h,
            width: double.infinity,
            child: CustomImage(path: item.imageUrl, fit: BoxFit.cover),
          ),
          Utils.verticalSpace(6.h),
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(RouteNames.productDetailsScreen);
            },
            child: CustomText(
              text: item.name,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              maxLine: 2,
              textAlign: TextAlign.start,
            ),
          ),
          Utils.verticalSpace(8.h),
          Row(
            children: [
              CustomText(
                text: "\$59.99",
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
