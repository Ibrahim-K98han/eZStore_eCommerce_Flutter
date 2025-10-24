import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/k_images.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_image.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySupportTicketScreen extends StatelessWidget {
  const MySupportTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "My Support Ticket",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 0,
        backgroundColor: secondaryColor,
        child: Icon(Icons.add, color: whiteColor),
        onPressed: () {},
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: greyLightColor,
                      hintText: 'Order ID, product or ....',
                      hintStyle: TextStyle(
                        color: hintTextColor,
                        fontSize: 14.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: Utils.all(value: 10.r),
                        child: CustomImage(
                          path: KImages.search,
                          color: hintTextColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  ),
                ),
                Utils.horizontalSpace(20),
                PopupMenuButton(
                  color: whiteColor,
                  menuPadding: EdgeInsets.zero,
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(
                          value: 'Open',
                          child: CustomText(text: 'Open'),
                        ),
                        PopupMenuItem(
                          value: 'Solve',
                          child: CustomText(text: 'Solve'),
                        ),
                      ],
                  child: CustomImage(
                    path: KImages.filter,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(16),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(color: borderColor);
                },
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                primary: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: Utils.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.supportResponseScreen,
                        );
                      },
                      child: MySupportTicketWidget(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySupportTicketWidget extends StatelessWidget {
  const MySupportTicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Account Support', fontWeight: FontWeight.w500),
        Utils.verticalSpace(10),
        Row(
          children: [
            CustomText(text: '#1325401'),
            Utils.horizontalSpace(8.w),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: sTextColor.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            Utils.horizontalSpace(8.w),
            CustomText(text: '2 Days ago'),
            Utils.horizontalSpace(8.w),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: sTextColor.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            Utils.horizontalSpace(8.w),
            Container(
              width: 44.w,
              height: 20,
              padding: Utils.symmetric(h: 4.0, v: 2.0),
              decoration: BoxDecoration(color: greenColor),
              child: Center(
                child: CustomText(
                  text: 'Open',
                  fontSize: 12.sp,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
