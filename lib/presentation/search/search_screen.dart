import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Data/dummy_data.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_image.dart';
import '../home_screen/component/category.dart';
import '../home_screen/component/product_card_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? sortBy;
  String? category;
  String? size;

  final List<String> sortOptions = [
    'Newest',
    'Oldest',
    'Price: Low to High',
    'Price: High to Low',
  ];
  final List<String> categoryOptions = ['All', 'Men', 'Women', 'Kids'];
  final List<String> sizeOptions = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    double cardHeight;
    if (screenHeight >= 1000) {
      cardHeight = 322.0; // Extra large screens (Pixel 9 Pro XL, etc.)
    } else if (screenHeight >= 900) {
      cardHeight = 240; // Large screens (Pixel 7 Pro, Pixel 8 Pro)
    } else if (screenHeight >= 800) {
      cardHeight = 246; // Medium-Large screens
    } else if (screenHeight >= 700) {
      cardHeight = 250; // Medium screens (Most common)
    } else {
      cardHeight = 250; // Small screens (720p devices)
    }
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: greyLightColor,
            hintText: 'Search Products...',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
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
      body: Padding(
        padding: Utils.symmetric(h: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.shopFilterScreen);
                    },
                    child: Container(
                      padding: Utils.symmetric(h: 12.w, v: 10.h),
                      decoration: BoxDecoration(
                        color: greyLightColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          CustomImage(path: KImages.filter),
                          SizedBox(width: 6.w),
                          CustomText(
                            text: "Filter",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sort By
                  _buildDropdown(
                    hint: 'Sort by',
                    value: sortBy,
                    items: sortOptions,
                    onChanged: (v) => setState(() => sortBy = v),
                  ),

                  // Category
                  _buildDropdown(
                    hint: 'Category',
                    value: category,
                    items: categoryOptions,
                    onChanged: (v) => setState(() => category = v),
                  ),

                  // Size
                  _buildDropdown(
                    hint: 'Size',
                    value: size,
                    items: sizeOptions,
                    onChanged: (v) => setState(() => size = v),
                  ),
                ],
              ),
            ),
            SearchCategory(),
            Utils.verticalSpace(6.h),
            CustomText(
              text: "Showing results for “Women's Clothing”",
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(6.h),
            Expanded(
              child: GridView.builder(
                padding: Utils.all(value: 0.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.w,
                  mainAxisSpacing: 6.h,
                  mainAxisExtent: cardHeight,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final sale = productList[index];
                  return ProductCard(item: sale);
                },
              ),
            ),
            Utils.verticalSpace(10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: const Color(0xffF8FAFC),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: DropdownButton<String>(
          padding: Utils.symmetric(h: 4.w),
          value: value,
          hint: Text(hint, style: const TextStyle(fontWeight: FontWeight.w500)),
          underline: const SizedBox(),
          icon: Icon(Icons.keyboard_arrow_down_rounded, size: 12.sp),
          items:
              items
                  .map(
                    (e) =>
                        DropdownMenuItem(value: e, child: CustomText(text: e)),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class SearchCategory extends StatefulWidget {
  const SearchCategory({super.key});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.local_fire_department,
      'label': 'Best Selling',
      'color': Colors.red,
    },
    {'icon': Icons.star, 'label': '5 Star Rated', 'color': Colors.amber},
    {
      'icon': Icons.local_offer,
      'label': 'Deal of the Day',
      'color': Colors.blueGrey,
    },
    {
      'icon': Icons.new_releases,
      'label': 'New Arrivals',
      'color': Colors.indigo,
    },
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --- Category Tabs ---
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final item = categories[index];
              final isSelected = selectedIndex == index;
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? item['color'].withOpacity(0.08)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 20.sp, color: item['color']),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: item['label'],
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? item['color'] : blackColor,
                            ),
                            if (isSelected)
                              Container(
                                width: 50.w,
                                height: 2.h,
                                decoration: BoxDecoration(
                                  color: item['color'],
                                  borderRadius: BorderRadius.circular(1.r),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
