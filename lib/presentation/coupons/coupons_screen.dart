import 'package:dotted_border/dotted_border.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Coupons",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: CouponsData(),
    );
  }
}

class CouponsData extends StatefulWidget {
  const CouponsData({super.key});

  @override
  State<CouponsData> createState() => _CouponsDataState();
}

class _CouponsDataState extends State<CouponsData> {
  final List<String> couponList = [
    'All',
    'Expiring Soon',
    'New',
    'Shipping',
    'Discount',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
          child: ListView.builder(
            padding: Utils.only(left: 20.w),
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            primary: true,
            shrinkWrap: true,
            itemCount: couponList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: Utils.only(right: 10.w),
                child: Container(
                  padding: Utils.symmetric(),
                  decoration: BoxDecoration(
                    color: greyLightColor,
                    border: Border.all(color: borderColor),
                  ),
                  child: Center(
                    child: CustomText(text: couponList[index], fontSize: 11.sp),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return CouponsCard();
            },
          ),
        ),
      ],
    );
  }
}

class CouponsCard extends StatelessWidget {
  const CouponsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(v: 10.0),
      child: Container(
        padding: Utils.symmetric(h: 7.w, v: 6.0),
        decoration: BoxDecoration(
          color: snowPink,
          border: Border.all(color: snowPinkBold),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Discount', fontSize: 16.sp),

                CustomText(text: 'For all orders', fontSize: 16.sp),
              ],
            ),
            Utils.verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: '25% ',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                    ),
                    CustomText(
                      text: 'OFF',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(text: 'from ', fontSize: 16.sp),
                    CustomText(
                      text: '200\$',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
            DottedBorder(
              options: CustomPathDottedBorderOptions(
                padding: EdgeInsets.zero,
                borderPadding: EdgeInsets.zero,
                color: snowPinkBold,
                strokeWidth: 1,
                dashPattern: [6, 8],
                customPath:
                    (size) =>
                        Path()
                          ..moveTo(0, size.height)
                          ..relativeLineTo(size.width, 0),
              ),
              child: CustomText(
                text:
                    '                                                                                                          ',
              ),
            ),
            Utils.verticalSpace(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'M0234231', fontWeight: FontWeight.w600),
                PrimaryButton(
                  minimumSize: Size(84.w, 24),
                  borderRadiusSize: 0,
                  fontSize: 12.sp,
                  text: 'Apply Code',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
