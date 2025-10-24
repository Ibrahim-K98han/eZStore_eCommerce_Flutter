import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:ezstore/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceManagerScreen extends StatelessWidget {
  const DeviceManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final devices = [
      {
        'os': 'Android v16.2',
        'location': '103.26.246.158',
        'lastSession': 'This device',
      },
      {
        'os': 'macOS Catalina',
        'location': '103.26.246.158',
        'lastSession': '22 hours ago',
      },
      {
        'os': 'macOS Catalina',
        'location': '103.26.246.158',
        'lastSession': '1 day ago',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Device Manager",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'My Devices', fontWeight: FontWeight.w500),
                Container(
                  padding: Utils.symmetric(h: 8.0, v: 4.0),
                  decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: CustomText(
                    text: '5/3 devices',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(8),

            Container(
              padding: Utils.symmetric(h: 8.0, v: 10.0),
              color: borderColor,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomText(text: 'OS', fontSize: 11.sp),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomText(text: 'Location', fontSize: 11.sp),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomText(text: 'Last session', fontSize: 11.sp),
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomText(text: 'Actions', fontSize: 11.sp),
                  ),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return Container(
                  padding: Utils.symmetric(h: 4.0, v: 12.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomText(text: device['os']!, fontSize: 12.sp),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: device['location']!,
                          fontSize: 12.sp,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: device['lastSession']!,
                          fontSize: 12.sp,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
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
                                      padding: Utils.symmetric(
                                        h: 10.w,
                                        v: 12.h,
                                      ),
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
                                            path: KImages.deviceDelete,
                                            width: 80.w,
                                            height: 80.h,
                                          ),
                                          Utils.verticalSpace(12.h),
                                          CustomText(
                                            text:
                                                'Are you Sure Remove “macOS\nCatalina” This device.',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.center,
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
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      border: Border.all(
                                                        color: borderColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: CustomText(
                                                        text: 'No',
                                                        fontSize: 11.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Utils.horizontalSpace(10.w),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width: 140.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                    ),
                                                    child: Center(
                                                      child: CustomText(
                                                        text: 'Remove',
                                                        fontSize: 11.sp,
                                                        color: whiteColor,
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
                                },
                              );
                            },
                            child: CustomImage(path: KImages.trash),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Utils.verticalSpace(20),
            Container(
              padding: Utils.symmetric(h: 10.0, v: 6.0),
              decoration: BoxDecoration(color: snowPink),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Need help?'),
                  PrimaryButton(
                    borderRadiusSize: 0.0,
                    bgColor: secondaryColor,
                    minimumSize: Size(117.w, 32),
                    text: 'Contact Support',
                    fontSize: 12.sp,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
