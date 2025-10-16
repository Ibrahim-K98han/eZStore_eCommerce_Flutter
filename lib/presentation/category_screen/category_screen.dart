
import 'package:ezstore/Data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../home_screen/component/inner_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  int _currentIndex = 0;

  final List<String> categories = [
    'Just for You',
    'New In',
    'Sale',
    'Men Clothing',
    'Beachwear',
    'Shoes',
    'Kids',
    'Curve',
    'Home & Kitchen',
    'Toys & Games',
    'Home Textiles',
    'Sleepwear',
    'Sports Shoes',
  ];

  final List<String> topCategory = [
    'All',
    'Women',
    'Sports',
    'Men',
    'Shoes',
    'Curve',
    'Summer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 120,
        titleSpacing: 0,
        backgroundColor: Colors.white, // optional: cu
        title: Padding(
          padding: Utils.only(left: 16.0, right: 16.0, top: 40.0),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: greyLightColor,
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
              hintText: 'Search Products...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child:   Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImage(
                      path: KImages.camera,
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.cover,
                    ),
                    Utils.horizontalSpace(12.w),
                    Container(
                      width: 50.w,
                      height: 36.h,
                      padding: Utils.symmetric(h: 10.w, v: 8.h),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: CustomImage(
                        path: KImages.search,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ],
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(50.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
            child: Row(
              children: List.generate(topCategory.length, (index) {
                final active = _currentIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _currentIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(right: 12.w),
                    padding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: active ? secondaryColor : Colors.transparent,
                          width: 2.5,
                        ),
                      ),
                    ),
                    child: CustomText(
                      text: topCategory[index],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 120.w,
                  color: greyLightColor,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedIndex == index;
                      return InkWell(
                        onTap: () => setState(() => selectedIndex = index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color:
                                    isSelected
                                        ? Colors.red
                                        : Colors.transparent,
                                width: 3.w,
                              ),
                            ),
                            color:
                                isSelected ? Colors.white : Colors.transparent,
                          ),
                          child: CustomText(
                            text: categories[index],
                            fontSize: 11.sp,
                            color: isSelected ? Colors.red : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Shop by Category",
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                        Utils.verticalSpace(8.h),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 0.h,
                                  childAspectRatio: 0.65,
                                ),
                            itemCount: innerCategory.length,
                            itemBuilder: (context, index) {
                              final item = innerCategory[index];
                              return Column(
                                children: [
                                  Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99.r),
                                      color: Color(0xFFf8fafc),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(99.0),
                                      child: CustomImage(path: item.imageUrl, fit: BoxFit.cover),
                                    ),
                                  ),
                                  // Utils.verticalSpace(6.h),
                                  CustomText(text: item.name, fontSize: 11.sp, fontWeight: FontWeight.w500, maxLine: 1,textAlign: TextAlign.center,),

                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
