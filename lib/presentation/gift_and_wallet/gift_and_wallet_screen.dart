import 'package:ezstore/Data/dummy_data.dart';
import 'package:ezstore/presentation/order_confirm/order_confirm_screen.dart';
import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftAndWalletScreen extends StatelessWidget {
  const GiftAndWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Wallet & Gift Card",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: const GiftAndWalletData(),
    );
  }
}

class GiftAndWalletData extends StatelessWidget {
  const GiftAndWalletData({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Utils.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomImage(path: KImages.giftBg, width: double.infinity),
                Positioned(
                  top: 20.h,
                  left: 20.w,
                  right: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Total Balance',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                      Utils.verticalSpace(6.h),
                      Row(
                        children: [
                          CustomText(
                            text: '\$275.00',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                          Utils.horizontalSpace(6.w),
                          Container(
                            padding: Utils.all(value: 4.r),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12.sp,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      Utils.verticalSpace(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: 'Check Balance',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: whiteColor,
                                size: 12.sp,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.r),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                builder: (context) {
                                  return OrderBottomSheet();
                                },
                              );
                            },
                            child: Container(
                              padding: Utils.symmetric(h: 8.w, v: 4.h),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Link Card',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 12.sp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Utils.verticalSpace(22.h),
            CustomText(
              text: 'Best Gift Cards',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(12.h),
            GridView.builder(
              itemCount: giftCardList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.giftCardScreen);
                  },
                  child: GiftCardWidget(giftCard: giftCardList[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GiftCardWidget extends StatelessWidget {
  const GiftCardWidget({super.key, required this.giftCard});

  final GiftCard giftCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      width: 167,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            path: giftCard.img,
            width: 168.w,
            height: 92,
            fit: BoxFit.cover,
          ),

          Utils.verticalSpace(4.0),
          Row(
            children: [
              CustomText(text: 'Value ', fontSize: 11.sp),
              CustomText(
                text: '\$${giftCard.value} ',
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: Utils.symmetric(h: 8.w),
                child: CustomText(text: '|', color: borderColor),
              ),
              CustomImage(path: KImages.sale, width: 14.w, height: 14.h),
              Utils.horizontalSpace(2.w),
              CustomText(
                text: 'Price ',
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
              CustomText(
                text: '\$${giftCard.price}',
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: secondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
