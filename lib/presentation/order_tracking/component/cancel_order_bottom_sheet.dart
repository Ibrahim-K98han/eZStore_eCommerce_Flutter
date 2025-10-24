import 'package:ezstore/presentation/order_tracking/component/packaged_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constraints.dart';
import '../../../utils/custom_form.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_dropdown_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/primary_button.dart';

class CancelOrderBottomSheet extends StatefulWidget {
  const CancelOrderBottomSheet({super.key});

  @override
  State<CancelOrderBottomSheet> createState() => _CancelOrderBottomSheetState();
}

class _CancelOrderBottomSheetState extends State<CancelOrderBottomSheet> {
  String? selectedReason;

  final List<String> reasons = [
    'Wrong item received',
    'Item damaged',
    'Delivery delay',
    'Changed my mind',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.h,
      padding: Utils.symmetric(h: 16.0, v: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: 'Cancel Order',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
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
            ],
          ),
          Utils.verticalSpace(20.h),
          PackagedItemsWidget(text: 'Refund Items'),
          Utils.verticalSpace(12.h),
          CustomText(text: 'Select a Reason'),
          Utils.verticalSpace(4.h),
          CustomDropdownButton(
            value: selectedReason,
            hintText: 'Select a reason',
            items: reasons,
            onChanged: (value) {
              setState(() {
                selectedReason = value;
              });
            },
            itemBuilder: (reasons) => CustomText(text: reasons),
          ),
          Utils.verticalSpace(10.h),
          CustomFormWidget(
            label: 'Additional Information',
            bottomSpace: 8.h,
            child: TextFormField(
              decoration: InputDecoration(hintText: 'e.g. Additional details'),
            ),
          ),
          Utils.verticalSpace(6.h),
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
              SizedBox(width: 4.w),
              Row(
                children: [
                  CustomText(text: 'I agree with the ', color: greyColor),
                  CustomText(
                    text: 'Term and Conditions',
                    color: greyColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(20.h),
          PrimaryButton(
            bgColor: secondaryColor,
            borderRadiusSize: 0.r,
            minimumSize: Size(double.maxFinite, 44.h),
            text: 'Submit',
            onPressed: () {
              Navigator.pop(context);
            }

              // showDialog(
              //   context: context,
              //   barrierDismissible: true,
              //   builder: (BuildContext context) {
              //     return Dialog(
              //       insetPadding: Utils.symmetric(h: 14.w),
              //       backgroundColor: whiteColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(0.r),
              //       ),
              //       child: Padding(
              //         padding: Utils.symmetric(h: 10.w, v: 12.h),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Align(
              //               alignment: Alignment.centerRight,
              //               child: GestureDetector(
              //                 onTap: () {
              //                   Navigator.pop(context);
              //                 },
              //                 child: CustomImage(
              //                   path: KImages.closeIcon,
              //                   width: 32.w,
              //                   height: 32.h,
              //                 ),
              //               ),
              //             ),
              //             Utils.verticalSpace(12.h),
              //             CustomImage(
              //               path: KImages.shoppingCart,
              //               width: 80.w,
              //               height: 80.h,
              //             ),
              //             Utils.verticalSpace(12.h),
              //             Text(
              //               'Order Placed Successfully!',
              //               style: TextStyle(
              //                 fontSize: 16.sp,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //             Utils.verticalSpace(12.h),
              //             Text(
              //               textAlign: TextAlign.center,
              //               '''Thank you for your purchase. We’ll notify you when your order is on the way.''',
              //               style: TextStyle(fontSize: 12.sp),
              //             ),
              //             Utils.verticalSpace(12.h),
              //             Row(
              //               children: [
              //                 Expanded(
              //                   child: GestureDetector(
              //                     onTap: () {},
              //                     child: Container(
              //                       width: 140.w,
              //                       height: 44.h,
              //                       decoration: BoxDecoration(
              //                         color: whiteColor,
              //                         border: Border.all(color: borderColor),
              //                       ),
              //                       child: Center(
              //                         child: CustomText(
              //                           text: 'Track Order',
              //                           fontSize: 11.sp,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Utils.horizontalSpace(10.w),
              //                 Expanded(
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       Navigator.pop(context);
              //                     },
              //                     child: Container(
              //                       width: 140.w,
              //                       height: 44.h,
              //                       decoration: BoxDecoration(
              //                         color: Colors.black,
              //                         //     border: Border.all(color: borderColor),
              //                       ),
              //                       child: Center(
              //                         child: CustomText(
              //                           text: 'Continue',
              //                           fontSize: 11.sp,
              //                           color: whiteColor,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // );

          ),
        ],
      ),
    );
  }
}
