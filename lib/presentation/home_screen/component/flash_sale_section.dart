import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Utils.symmetric(h: 17.w, v: 10.h),
        child: Container(
          padding: Utils.symmetric(h: 10.w, v: 10.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF8FFD8), Color(0xFFF2FFF4)],
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
                      CustomText(text: "Fla", fontWeight: FontWeight.w600),
                      CustomImage(path: KImages.flash),
                      CustomText(text: "h Sale", fontWeight: FontWeight.w600),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(text: "Shop More"),
                      CustomImage(path: KImages.arrowRight),
                    ],
                  ),
                ],
              ),
              Utils.verticalSpace(10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(flashSales.length, (index) {
                      final sale = flashSales[index];
                      return Padding(
                        padding: Utils.only(right: 7.w),
                        child: FlashSaleCard(item: sale,),
                      );
                    }),
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

class FlashSaleCard extends StatelessWidget {
  const FlashSaleCard({super.key, required this.item});

  final InnerCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.h,
            width: double.infinity,
            child: CustomImage(path: item.imageUrl, fit: BoxFit.cover),
          ),
          Utils.verticalSpace(6.h),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RouteNames.productDetailsScreen);
            },
            child: CustomText(
              text: item.name,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              maxLine: 3,
              textAlign: TextAlign.center,
            ),
          ),
          Utils.verticalSpace(6.h),
          Row(
            children: [
              CustomImage(path: KImages.reviewStar, height: 10.0),
              Utils.horizontalSpace(2.w),
              CustomText(
                text: "4.8(397) | 540 Sold",
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                color: sTextColor,
              ),
            ],
          ),
          Utils.verticalSpace(8.h),
          Row(
            children: [
              CustomText(
                text: "\$59.99",
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
              Utils.horizontalSpace(8.w),
              CustomText(
                text: "\$59.99",
                color: Color(0xFF9CA3AF),
                fontSize: 9.sp,
                decoration: TextDecoration.lineThrough,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
