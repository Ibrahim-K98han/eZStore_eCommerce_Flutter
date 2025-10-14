import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotSaleSection extends StatelessWidget {
  const HotSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: Utils.symmetric(h: 17.w),
          child: Row(
            children: [
              Padding(
                padding: Utils.symmetric(h: 0.w, v: 10.h),
                child: Container(
                  padding: Utils.symmetric(h: 10.w, v: 10.h),
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Hot", fontWeight: FontWeight.w600),
                              CustomImage(path: KImages.hot),
                              CustomText(text: "Sale", fontWeight: FontWeight.w600),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(text: "More"),
                              CustomImage(path: KImages.arrowRight),
                            ],
                          ),
                        ],
                      ),
                      Utils.verticalSpace(10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(hotSale.length, (index) {
                            final sale = hotSale[index];
                            return Padding(
                              padding: Utils.only(right: 7.w),
                              child: HotSaleCard(item: sale,),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Utils.horizontalSpace(8.w),
              Padding(
                padding: Utils.symmetric(h: 0.w, v: 10.h),
                child: Container(
                  padding: Utils.symmetric(h: 10.w, v: 10.h),
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
                              CustomText(text: "Hot", fontWeight: FontWeight.w600),
                              CustomImage(path: KImages.hot),
                              CustomText(text: "Sale", fontWeight: FontWeight.w600),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(text: "More"),
                              CustomImage(path: KImages.arrowRight),
                            ],
                          ),
                        ],
                      ),
                      Utils.verticalSpace(10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(hotSale.length, (index) {
                            final sale = hotSale[index];
                            return Padding(
                              padding: Utils.only(right: 7.w),
                              child: HotSaleCard(item: sale,),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
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
          CustomText(
            text: item.name,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            maxLine: 3,
            textAlign: TextAlign.start,
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
