import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_app_bar.dart';
import 'package:ezstore/widgets/custom_dropdown_button.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_tracker/step_tracker.dart';

import '../../utils/custom_form.dart';
import '../../utils/k_images.dart';
import '../../widgets/border_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/primary_button.dart';
import '../order_confirm/order_confirm_screen.dart';
import 'component/address_widget.dart';
import 'component/cancel_order_bottom_sheet.dart';
import 'component/packaged_items_widget.dart';
import 'component/tracking_heading_section.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tracking'),
      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrackingHeadingSection(),
              StepTracker(
                dotSize: 9,
                circleIconSize: 24,
                showIcon: true,
                selectedColor: textColor,
                stepTrackerType: StepTrackerType.dotVertical,
                pipeSize: 30,
                steps: [
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Your package arrived at local airport",
                    state: TrackerState.complete,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Package left transit country/region",
                    state: TrackerState.none,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Package left transit country/region",
                    state: TrackerState.none,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Package left transit country/region",
                    state: TrackerState.none,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Package left transit country/region",
                    state: TrackerState.none,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Package left transit country/region",
                    state: TrackerState.none,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                  Steps(
                    titleStyle: TextStyle(fontSize: 12.sp),
                    title: "Package left transit country/region",
                    state: TrackerState.none,
                    description: 'Sep 30, 14:16 GMT+ 06:00',
                  ),
                ],
              ),
              Utils.verticalSpace(16.h),
              AddressWidget(),
              Utils.verticalSpace(16.h),
              PackagedItemsWidget(text: 'Packaged items'),
              Utils.verticalSpace(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BorderButton(onTap: () {}, text: 'Add to Cart'),
                  Utils.horizontalSpace(10.w),
                  BorderButton(
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
                          return CancelOrderBottomSheet();
                        },
                      );
                    },
                    text: 'Returns/ Refunds',
                  ),
                ],
              ),
              Utils.verticalSpace(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
