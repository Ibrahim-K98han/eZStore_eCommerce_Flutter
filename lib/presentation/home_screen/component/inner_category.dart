import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';

class InnerCategory extends StatelessWidget {
  const InnerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Utils.only(bottom: 0.h, left: 8.w, top: 12.h),
        child: SizedBox(
          height: 210.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 10,
             mainAxisExtent: 76.0,
            ),
            itemCount: innerCategory.length,
            itemBuilder: (context, index) {
              return CategoryCard(categoryItem: innerCategory[index],);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryItem});

  final InnerCategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52.h,
          width: 52.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99.0),
            color: Color(0xFFf8fafc),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99.0),
            child: CustomImage(path: categoryItem.imageUrl, fit: BoxFit.cover),
          ),
        ),
        Utils.verticalSpace(6.h),
        CustomText(text: categoryItem.name, fontSize: 9.sp, fontWeight: FontWeight.w500, maxLine: 2,textAlign: TextAlign.center,),
      ],
    );
  }
}
