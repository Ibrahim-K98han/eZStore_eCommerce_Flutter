import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/custom_form.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftCardScreen extends StatelessWidget {
  const GiftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Gift Card",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: GiftCardLoadedData(),
    );
  }
}

class GiftCardLoadedData extends StatefulWidget {
  const GiftCardLoadedData({super.key});

  @override
  State<GiftCardLoadedData> createState() => _GiftCardLoadedDataState();
}

class _GiftCardLoadedDataState extends State<GiftCardLoadedData> {
  final List<String> amount = [
    '\$80.00',
    '\$100.00',
    '\$200.00',
    '\$500.00',
    '\$800.00',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImage(
                path: KImages.gift1,
                width: 260.w,
                height: 142,
              ),
            ),
            Utils.verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Gift Cards',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: '\$80.00',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Utils.verticalSpace(16),
            CustomText(text: 'Choose template ', fontWeight: FontWeight.w500),
            Utils.verticalSpace(8),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: Utils.only(right: 8.w),
                    child: CustomImage(
                      path: KImages.gift1,
                      width: 80.w,
                      height: 44,
                    ),
                  );
                },
              ),
            ),
            Utils.verticalSpace(14),
            CustomText(text: 'Amount', fontWeight: FontWeight.w500),
            Utils.verticalSpace(8),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                primary: true,
                shrinkWrap: true,
                itemCount: amount.length,
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
                        child: CustomText(text: amount[index], fontSize: 11.sp),
                      ),
                    ),
                  );
                },
              ),
            ),
            Utils.verticalSpace(14),
            CustomFormWidget(
              label: 'To',
              bottomSpace: 12.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: greyColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),

                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  hintText: 'Enter email address',
                ),
              ),
            ),
            CustomFormWidget(
              label: 'From',
              bottomSpace: 12.sp,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: greyColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            CustomFormWidget(
              label: 'Add a message',
              bottomSpace: 12.sp,
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: greyColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  hintText: 'Write a short message',
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(Utils.radius(2.4))),
                  activeColor: primaryColor,
                  onChanged: (bool? val) {},
                ),
                Utils.horizontalSpace(4),
                Row(
                  children: [
                    CustomText(
                      text: 'By placing this order, I agress with ',
                      color: greyColor,
                      fontSize: 10.sp,
                    ),
                    CustomText(
                      text: 'Term and Conditions',
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ],
                ),
              ],
            ),
            Utils.verticalSpace(24),
            PrimaryButton(
              borderRadiusSize: 0.0,
              bgColor: secondaryColor,
              minimumSize: Size(double.infinity, 44),
              text: 'Checkout',
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: Utils.symmetric(h: 14.w),
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                      child: Padding(
                        padding: Utils.symmetric(h: 10.w, v: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CustomImage(
                                  path: KImages.closeIcon,
                                  width: 32.w,
                                  height: 32.h,
                                ),
                              ),
                            ),
                            Utils.verticalSpace(12.h),
                            CustomImage(
                              path: KImages.shoppingCart,
                              width: 80.w,
                              height: 80.h,
                            ),
                            Utils.verticalSpace(12.h),
                            Text(
                              'Order Placed Successfully!',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Utils.verticalSpace(12.h),
                            Text(
                              textAlign: TextAlign.center,
                              '''Thank you for your purchase. We’ll notify you when your order is on the way.''',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Utils.verticalSpace(12.h),
                            Padding(
                              padding: Utils.symmetric(h: 40),
                              child: PrimaryButton(
                                borderRadiusSize: 0.0,
                                minimumSize: Size(double.infinity, 44),
                                text: 'Continue Shopping',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Utils.verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
