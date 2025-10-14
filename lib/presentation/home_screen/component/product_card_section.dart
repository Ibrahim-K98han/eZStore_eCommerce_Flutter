import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCardSection extends StatelessWidget {
  const ProductCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: Utils.symmetric(h: 17.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 10,
          mainAxisExtent: 280.h, // Adjust height for your card
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final sale = productList[index];
            return ProductCard(item: sale);
          },
          childCount: productList.length,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final InnerCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 166.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 166.h,
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
