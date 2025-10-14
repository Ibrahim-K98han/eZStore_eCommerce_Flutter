import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_app_bar.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/custom_form.dart';
import '../../widgets/feeback_dialog.dart';
import '../product_details/product_details_screen.dart';

class OrderConfirmScreen extends StatefulWidget {
  const OrderConfirmScreen({super.key});

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Order Confirmation',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBar: Container(
        height: 96.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // shadow color
              offset: Offset(0, -4), // vertical offset: negative for top
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                text: 'Total \$79.99',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: PrimaryButton(
                bgColor: secondaryColor,
                minimumSize: Size(160.w, 44.h),
                borderRadiusSize: 0.r,
                text: 'Place Order',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
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
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Shipping Address', fontWeight: FontWeight.w500),
            Container(
              decoration: BoxDecoration(
                color: greyLightColor,
                border: Border.all(color: borderColor.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(12.w),
              margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Jonson Roy #0154',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Utils.verticalSpace(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: '+8801 16890 91933',
                        fontSize: 12,
                        color: textLightColor,
                      ),
                      CustomImage(path: KImages.arrowRight),
                    ],
                  ),
                  Utils.verticalSpace(4.h),
                  CustomText(
                    text: 'House-8, Road-7, Block-A, Dhaka-1216',
                    fontSize: 12,
                    color: textLightColor,
                  ),
                ],
              ),
            ),
            CustomText(text: 'Products', fontWeight: FontWeight.w500),
            Utils.verticalSpace(6.h),
            ...List.generate(
              4,
                  (index) =>
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: CartWidget(),
                  ),
            ),
            CustomText(text: 'Payment Method', fontWeight: FontWeight.w500),
            Utils.verticalSpace(8.h),
            Container(
              decoration: BoxDecoration(color: greyLightColor),
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: textColor),
                        ),
                      ),
                      Utils.horizontalSpace(8.w),
                      CustomText(text: '466542****2108'),
                      Utils.horizontalSpace(8.w),
                      CustomImage(path: KImages.visa),
                    ],
                  ),
                  Utils.verticalSpace(8.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: 'Expiry Date 05/28',
                          fontSize: 12.sp,
                        ),
                      ),
                      Utils.horizontalSpace(8.w),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter CVV',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Utils.verticalSpace(16.h),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: textColor),
                      ),
                    ),
                    Utils.horizontalSpace(6.w),
                    CustomImage(path: KImages.addNewCard),
                    Utils.horizontalSpace(6.w),
                    CustomText(text: 'Add new card'),
                  ],
                ),
                Utils.verticalSpace(6.h),
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: textColor),
                      ),
                    ),
                    Utils.horizontalSpace(6.w),
                    CustomImage(
                      path: KImages.googlePay,
                      width: 24.w,
                      height: 18.h,
                    ),
                    Utils.horizontalSpace(6.w),
                    CustomText(text: 'Google Pay'),
                  ],
                ),
                Utils.verticalSpace(6.h),
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: textColor),
                      ),
                    ),
                    Utils.horizontalSpace(6.w),
                    CustomImage(path: KImages.paypal),
                    Utils.horizontalSpace(6.w),
                    CustomText(text: 'PayPal'),
                  ],
                ),
              ],
            ),
            Utils.verticalSpace(16.h),
            CustomText(text: 'Summary', fontWeight: FontWeight.w500),
            Utils.verticalSpace(12.h),
            SummaryWidget(),
          ],
        ),
      ),
    );
  }
}

class OrderBottomSheet extends StatefulWidget {
  const OrderBottomSheet({super.key});

  @override
  State<OrderBottomSheet> createState() => _OrderBottomSheetState();
}

class _OrderBottomSheetState extends State<OrderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.h,
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: 'Add new card',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Utils.verticalSpace(6.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImage(
                          path: KImages.visa,
                          width: 20.w,
                          height: 20.h,
                        ),
                        CustomImage(
                          path: KImages.googlePay,
                          width: 20.w,
                          height: 20.h,
                        ),
                        CustomImage(
                          path: KImages.paypal,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: CustomImage(
                  path: KImages.closeIcon,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ],
          ),
          CustomFormWidget(
            label: 'Cardholder name',
            bottomSpace: 8.h,
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
                hintText: 'Jonson Roy',
              ),
            ),
          ),
          CustomFormWidget(
            label: 'Card Number',
            bottomSpace: 8.h,
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
                hintText: '000000000000000000',
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomFormWidget(
                  label: 'Expire Date',
                  bottomSpace: 8.h,
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
                      hintText: 'MM/YY',
                    ),
                  ),
                ),
              ),
              Utils.horizontalSpace(12.w),
              Expanded(
                child: CustomFormWidget(
                  label: 'CVV',
                  bottomSpace: 8.h,
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
                      hintText: '030',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Save Card Details',
                fontWeight: FontWeight.w500,
              ),
              SwitchWidget(initialValue: false, onToggle: (value) {}),
            ],
          ),

          PrimaryButton(
            bgColor: secondaryColor,
            borderRadiusSize: 0.r,
            minimumSize: Size(double.maxFinite, 44.h),
            text: 'Save Card',
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
                      padding: Utils.symmetric(h: 10.w,v: 12.h),
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
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 140.w,
                                    height: 44.h,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(color: borderColor),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: 'Track Order', fontSize: 11.sp,),
                                    ),
                                  ),
                                ),
                              ),
                              Utils.horizontalSpace(10.w),
                              Expanded(
                                child: PrimaryButton(
                                  minimumSize: Size(140.w, 44.h),
                                  borderRadiusSize: 0.r,
                                  fontSize: 11.sp,
                                  text: 'Continue Shopping',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImage(
          path: KImages.detailsImgOne,
          width: 72.w,
          height: 72.h,
          fit: BoxFit.cover,
        ),
        Utils.horizontalSpace(10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Vibrant Sunset Maxi Dress',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              Row(
                children: [
                  CustomText(text: 'Color: Gray'),
                  Utils.horizontalSpace(8.w),
                  CustomText(text: 'Size: M'),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // spread price & qty
                children: [
                  // Price info
                  Row(
                    children: [
                      CustomText(
                        text: '\$79.99',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Utils.horizontalSpace(6.w),
                      CustomText(
                        text: '\$98.99',
                        fontSize: 12.sp,
                        color: greyColor.withOpacity(0.4),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ],
                  ),
                  // Trash + Qty + Plus aligned right
                  Row(
                    children: [
                      Container(
                        padding: Utils.symmetric(h: 6.w, v: 6.h),
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.1),
                          border: Border.all(color: textColor.withOpacity(0.2)),
                        ),
                        child: CustomImage(path: KImages.trash),
                      ),
                      Container(
                        padding: Utils.symmetric(h: 12.w, v: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: textColor.withOpacity(0.2)),
                        ),
                        child: CustomText(text: '1', fontSize: 10.sp),
                      ),
                      Container(
                        padding: Utils.symmetric(h: 6.w, v: 6.h),
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.1),
                          border: Border.all(color: textColor.withOpacity(0.2)),
                        ),
                        child: CustomImage(path: KImages.plus),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Item Total',
              fontSize: 12.sp,
              color: textLightColor,
            ),
            CustomText(
              text: '\$239.97',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Utils.verticalSpace(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Discount',
              fontSize: 12.sp,
              color: textLightColor,
            ),
            CustomText(
              text: '\$9.97',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Utils.verticalSpace(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Subtotal',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              text: '\$119.97',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Utils.verticalSpace(4.h),
        Utils.horizontalLine(),
        Utils.verticalSpace(6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Promo Codes',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            Row(
              children: [
                CustomText(
                  text: 'Enter',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                CustomImage(path: KImages.arrowRight),
              ],
            ),
          ],
        ),
        Utils.verticalSpace(6.h),
        Utils.horizontalLine(),
        Utils.verticalSpace(6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Shipping Fee',
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: '\$59.26',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
        Utils.verticalSpace(6.h),
      ],
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    super.key,
    this.text,
    required this.initialValue,
    required this.onToggle,
    this.widget,
    this.icon,
  });

  final String? text;
  final String? icon;
  final bool initialValue;
  final ValueChanged<bool> onToggle;
  final Widget? widget;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void _toggle() {
    setState(() => isOn = !isOn);
    widget.onToggle(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // CustomImage(
                //   path: widget.icon,
                //   width: 24,
                //   height: 24,
                //   fit: BoxFit.cover,
                // ),
                Utils.horizontalSpace(12),
                CustomText(
                  text: widget.text ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              children: [
                const CustomText(text: '', fontWeight: FontWeight.w500),
                Utils.horizontalSpace(8),
                GestureDetector(
                  onTap: _toggle,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: 50,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: isOn ? textColor : Colors.grey.shade100,
                    ),
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 100),
                      alignment:
                      isOn ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
