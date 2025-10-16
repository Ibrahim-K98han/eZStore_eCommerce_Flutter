import 'package:carousel_slider/carousel_slider.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Data/dummy_data.dart';
import '../home_screen/component/product_card_section.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    double aspectRatio;
    if (screenHeight < 800) {
      aspectRatio = 0.72; // slightly taller cards for small screens
    } else if (screenHeight < 900) {
      aspectRatio = 0.74;
    } else {
      aspectRatio = 0.55;
    }
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 0.h),
        child: Container(
          padding: Utils.symmetric(h: 16.w),
          height: 90.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return AddToCartBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(color: borderColor, width: 1.0),
                    ),
                    child: Center(child: CustomText(text: 'Add to Cart')),
                  ),
                ),
              ),
              Utils.horizontalSpace(8.w),
              Expanded(
                child: PrimaryButton(
                  borderRadiusSize: 0.r,
                  text: 'Buy Now',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.orderConfirmScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SliderWidget(),
            ProductDetailsWidget(),
            ProductReviewRatingWidget(),
            Padding(
              padding: Utils.symmetric(h: 17.0),
              child: CustomText(text: "Similar Products", fontSize: 16.sp, fontWeight: FontWeight.w500,),
            ),
            Utils.verticalSpace(4.h),
            Padding(
              padding: Utils.symmetric(h: 17.0),
              child: GridView.builder(
                padding: Utils.all(value: 0.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                  childAspectRatio: aspectRatio,  // Ad
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final sale = productList[index];
                  return ProductCard(item: sale);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartBottomSheet extends StatefulWidget {
  const AddToCartBottomSheet({super.key});

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int selectedIndex = 1;

  final List<Color> colors = [
    Color(0xFFE5DDD6),
    Color(0xFFBFBFBF),
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      padding: Utils.symmetric(h: 17.0, v: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSpace(14.h),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: CustomImage(path: KImages.detailsImgOne),
                );
              },
            ),
          ),
          Utils.verticalSpace(10.h),
          CustomText(
            text: 'Double-Breasted Trench Coat',
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(6.h),
          Row(
            children: [
              CustomText(
                text: '\$79.99',
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              Utils.horizontalSpace(4.w),
              CustomText(
                text: '\$98.99',
                color: textGreyColor,
                decoration: TextDecoration.lineThrough,
                fontSize: 12.sp,
              ),
              Utils.horizontalSpace(12.w),
              Container(
                padding: Utils.symmetric(h: 6.w, v: 2.h),
                decoration: BoxDecoration(
                  color: greenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: CustomText(
                  text: '300+ Stocks',
                  color: greenColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(6.h),
          Row(
            children: [
              CustomText(text: 'Colors: ', fontSize: 12.sp),
              CustomText(text: 'Gray', fontWeight: FontWeight.w500),
            ],
          ),
          Utils.verticalSpace(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(colors.length, (index) {
              bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: isSelected ? EdgeInsets.all(2.w) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        isSelected
                            ? Border.all(color: Colors.black, width: 0.5.w)
                            : null,
                  ),
                  child: CircleAvatar(
                    backgroundColor: colors[index],
                    radius: 10.r,
                  ),
                ),
              );
            }),
          ),
          Utils.verticalSpace(6.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(text: 'Size: L', fontSize: 12.sp),
                  Utils.horizontalSpace(50.w),
                  CustomText(
                    text: 'Size Guide ',
                    decoration: TextDecoration.underline,
                    fontSize: 12.sp,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1),
                    ),
                    child: Center(child: CustomText(text: 'S')),
                  ),
                  Utils.horizontalSpace(6.w),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1),
                    ),
                    child: Center(child: CustomText(text: 'M')),
                  ),
                  Utils.horizontalSpace(6.w),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1),
                    ),
                    child: Center(child: CustomText(text: 'L')),
                  ),
                  Utils.horizontalSpace(6.w),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1),
                    ),
                    child: Center(child: CustomText(text: 'XL')),
                  ),
                  Utils.horizontalSpace(6.w),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1),
                    ),
                    child: Center(child: CustomText(text: 'XXL')),
                  ),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImage(path: KImages.wishlistInactive),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteNames.allCartScreen);
                },
                child: Container(
                  width: 150.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: borderColor,width: 1),
                  ),
                  child: Center(child: CustomText(text: 'Add to Cart')),
                ),
              ),
              PrimaryButton(
                minimumSize: Size(150.w, 44.h),
                borderRadiusSize: 0.r,
                text: 'Buy Now',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.orderConfirmScreen);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductReviewRatingWidget extends StatefulWidget {
  const ProductReviewRatingWidget({super.key});

  @override
  State<ProductReviewRatingWidget> createState() =>
      _ProductReviewRatingWidgetState();
}

class _ProductReviewRatingWidgetState extends State<ProductReviewRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 17.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImage(path: KImages.star),
                  Utils.horizontalSpace(4.w),
                  Row(
                    children: [
                      CustomText(
                        text: '4.9',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Utils.horizontalSpace(4.w),
                      CustomText(text: '(134) Ratings', fontSize: 16.sp),
                    ],
                  ),
                ],
              ),
              CustomText(
                text: 'View All',
                fontSize: 12.sp,
                decoration: TextDecoration.underline,
              ),
            ],
          ),
          Utils.verticalSpace(8.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: CustomImage(
                path: KImages.person,
                width: 44.w,
                height: 44.h,
                fit: BoxFit.cover,
              ),
            ),
            title: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 16.sp,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder:
                  (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            subtitle: Row(
              children: [
                CustomText(text: 'by David Richard'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: borderColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                CustomText(text: 'April 27, 2025', fontSize: 12.sp),
              ],
            ),
          ),
          CustomText(
            text:
                '''“Good quality overall, but shipping took a little longer than expected. The product itself is excellent.”''',
            fontSize: 12.sp,
          ),
          Utils.verticalSpace(12.h),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CustomImage(path: KImages.reviewImg),
                );
              },
            ),
          ),
          Utils.verticalSpace(12.h),
          Row(
            children: [
              Container(
                width: 80.w,
                height: 28.h,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                ),
                child: Center(
                  child: CustomText(text: 'Helpful', fontSize: 12.sp),
                ),
              ),
              Utils.horizontalSpace(10.w),
              CustomText(
                text: 'Report abuse',
                fontSize: 12.sp,
                color: textGreyColor,
              ),
            ],
          ),
          Utils.verticalSpace(12.h),
        ],
      ),
    );
  }
}

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 17.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSpace(16.h),
          CustomText(text: 'Clothing', color: textGreyColor, fontSize: 12.sp),
          Utils.verticalSpace(8.h),
          CustomText(
            text: 'Double-Breasted Trench Coat',
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(8.h),
          Row(
            children: [
              CustomImage(
                path: KImages.star,
                width: 16.w,
                height: 16.h,
                fit: BoxFit.cover,
              ),
              Utils.horizontalSpace(4.w),
              CustomText(
                text: '4.8(379)',
                color: textGreyColor,
                fontSize: 12.sp,
              ),
              Utils.horizontalSpace(4.w),
              Container(color: textGreyColor, width: 1.w, height: 10.h),
              Utils.horizontalSpace(4.w),
              CustomText(
                text: '540 Sold',
                color: textGreyColor,
                fontSize: 12.sp,
              ),
            ],
          ),
          Utils.verticalSpace(8.h),
          Row(
            children: [
              CustomText(
                text: '\$79.99',
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              Utils.horizontalSpace(4.w),
              CustomText(
                text: '\$98.99',
                color: textGreyColor,
                decoration: TextDecoration.lineThrough,
                fontSize: 12.sp,
              ),
              Utils.horizontalSpace(12.w),
              Container(
                padding: Utils.symmetric(h: 6.w, v: 2.h),
                decoration: BoxDecoration(
                  color: greenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: CustomText(
                  text: '300+ Stocks',
                  color: greenColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(16.h),
          Row(
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Shipping from \$24',
                    color: textGreyColor,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                  Utils.horizontalSpace(4.w),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
              Utils.horizontalSpace(12.w),
              Row(
                children: [
                  CustomText(
                    text: 'Return Policy',
                    color: textGreyColor,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                  Utils.horizontalSpace(4.w),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(16.h),
          CustomText(
            text: 'Overview',
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Utils.horizontalLine(),
          Utils.verticalSpace(8.h),
          ReadMoreText(
            Utils.htmlTextConverter(
              '''The garments labelled as Committed are products that have been produced using sustainable fibers or processes, reducing their environmental impact ''',
            ),
            trimLength: 100,
            trimCollapsedText: 'See More',
            moreStyle: const TextStyle(
              fontSize: 12.0,
              color: redColor,
              height: 1.6,
            ),
            lessStyle: const TextStyle(
              fontSize: 12.0,
              color: redColor,
              height: 1.6,
            ),
            style: const TextStyle(fontSize: 14.0, color: blackColor),
          ),
          Utils.verticalSpace(16.h),
        ],
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int activeIndex = 0;
  final List<String> images = [
    KImages.sliderImage,
    KImages.sliderImageTwo,
    KImages.sliderImage,
    KImages.sliderImageTwo,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.h,
      width: double.infinity,
      child: Stack(
        children: [
          // Carousel Slider
          CarouselSlider(
            options: CarouselOptions(
              height: 370.h,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            items:
                images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: double.infinity,
                        child: CustomImage(
                          path: i,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
          ),

          // Top left back button
          Positioned(
            top: 50.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CustomImage(
                path: KImages.backArrow,
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),

          // Top right icons
          Positioned(
            top: 50.h,
            right: 20.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(
                  path: KImages.wishlistInactive,
                  color: Colors.white,
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 10.w),
                CustomImage(
                  path: KImages.share,
                  color: Colors.white,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ),

          // Bottom center dots
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: images.length,
                effect: ScrollingDotsEffect(
                  dotHeight: 8.h,
                  dotWidth: 8.h,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey.shade300,
                  spacing: 6.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
