import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/presentation/search/component/flash_sale_heading.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopFilterScreen extends StatefulWidget {
  const ShopFilterScreen({super.key});

  @override
  State<ShopFilterScreen> createState() => _ShopFilterScreenState();
}

class _ShopFilterScreenState extends State<ShopFilterScreen> {
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(
        padding: Utils.symmetric(v: 16.h),
        decoration: BoxDecoration(color: whiteColor),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 160.w,
                height: 44.h,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                ),
                child: Center(child: CustomText(text: 'Result')),
              ),
            ),
            Utils.horizontalSpace(10.w),
            Expanded(
              child: PrimaryButton(
                borderRadiusSize: 0.0,
                text: 'Show Results',
                minimumSize: Size(160.w, 44.h),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Utils.verticalSpace(10.h),
          FlashSaleHeading(),
          CategorySection(),
        ],
      ),
    );
  }
}

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;
  int selectedColor = 0;

  final List<String> categories = [
    'Gender',
    'Color',
    'Size',
    'Category',
    'Style',
    'Season',
    'Pattern',
    'Price Range(USD)',
  ];

  final List<String> genderList = ['Male', 'Female', 'Other', 'Boys', 'Girls'];
  final List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  final List<String> categoryList = ['T-shirt', 'Shoes', 'Jacket', 'Pants'];
  final List<String> styleList = ['Casual', 'Formal', 'Sport', 'Classic'];
  final List<String> seasonList = ['Summer', 'Winter', 'Autumn', 'Spring'];
  final List<String> patternList = ['Plain', 'Striped', 'Checked', 'Printed'];
  final List<String> priceList = ['0-20', '21-50', '51-100', '100+'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Utils.only(top: 10.h),
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
                      color: isSelected ? Colors.white : Colors.transparent,
                      child: CustomText(
                        text: categories[index],
                        fontSize: 11.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: buildCategoryContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryContent() {
    final String selectedCategory = categories[selectedIndex];

    switch (selectedCategory) {
      case 'Gender':
        return CustomWrapList(title: 'Gender', items: genderList);
      case 'Color':
        return CustomColorList(
          title: 'Color',
          colors: colorList,
          selectedColor: selectedColor,
          onSelect: (index) => setState(() => selectedColor = index),
        );
      case 'Size':
        return CustomWrapList(title: 'Standard Size', items: sizeList);
      case 'Category':
        return CustomWrapList(title: 'Category', items: categoryList);
      case 'Style':
        return CustomWrapList(title: 'Style', items: styleList);
      case 'Season':
        return CustomWrapList(title: 'Season', items: seasonList);
      case 'Pattern':
        return CustomWrapList(title: 'Pattern', items: patternList);
      case 'Price Range(USD)':
        return CustomWrapList(title: 'Price Range (USD)', items: priceList);
      default:
        return const SizedBox.shrink();
    }
  }
}

class CustomWrapList extends StatelessWidget {
  final String title;
  final List<String> items;

  const CustomWrapList({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, fontWeight: FontWeight.w600, color: textColor),
        Utils.verticalSpace(8.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: List.generate(
            items.length,
            (index) => Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
              decoration: BoxDecoration(border: Border.all(color: borderColor)),
              child: CustomText(
                text: items[index],
                fontSize: 12.sp,
                color: sTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomColorList extends StatelessWidget {
  final String title;
  final List<Color> colors;
  final int selectedColor;
  final Function(int) onSelect;

  const CustomColorList({
    super.key,
    required this.title,
    required this.colors,
    required this.selectedColor,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, fontWeight: FontWeight.w600, color: textColor),
        Utils.verticalSpace(8.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: List.generate(
            colors.length,
            (index) => GestureDetector(
              onTap: () => onSelect(index),
              child: Container(
                padding: Utils.all(value: 2.r),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        selectedColor == index ? textColor : Colors.transparent,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
