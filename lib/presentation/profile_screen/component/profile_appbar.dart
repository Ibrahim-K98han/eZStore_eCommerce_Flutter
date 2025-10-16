import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class ProfileAppbar extends StatefulWidget {
  const ProfileAppbar({super.key});

  @override
  State<ProfileAppbar> createState() => _ProfileAppbarState();
}

class _ProfileAppbarState extends State<ProfileAppbar> {
  String selectedLanguage = 'en';

  final Map<String, Map<String, String>> languages = {
    'en': {'name': 'English', 'flag': '🇺🇸'},
    'es': {'name': 'Español', 'flag': '🇪🇸'},
    'fr': {'name': 'Français', 'flag': '🇫🇷'},
    'de': {'name': 'Deutsch', 'flag': '🇩🇪'},
    'bn': {'name': 'বাংলা', 'flag': '🇧🇩'},
    'ar': {'name': 'العربية', 'flag': '🇸🇦'},
  };

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: Utils.vSize(100.h),
      backgroundColor: transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CustomImage(
                        path: KImages.person,
                        fit: BoxFit.cover,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    Utils.horizontalSpace(10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Jonson Roy',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                        CustomText(
                          text: 'jonsonroy@gmail.com',
                          fontSize: 11.sp,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedLanguage,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black87,
                          size: 20.sp,
                        ),
                        isDense: true,
                        menuWidth: 150.w,
                        items:
                            languages.entries.map((entry) {
                              return DropdownMenuItem<String>(
                                value: entry.key,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 28.w,
                                      height: 28.h,
                                      child: Center(
                                        child: Text(
                                          entry.value['flag']!,
                                          style:  TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                    ),
                                     SizedBox(width: 8.w),
                                    Text(
                                      entry.value['name']!,
                                      style:  TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedLanguage = newValue;
                            });
                          }
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return languages.entries.map((entry) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 28.w,
                                  height: 28.h,
                                  child: Center(
                                    child: Text(
                                      entry.value['flag']!,
                                      style:  TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList();
                        },
                      ),
                    ),
                    Utils.horizontalSpace(10.w),
                    GestureDetector(
                      onTap: () {},
                      child:  CustomImage(
                        path: KImages.setting,
                        height: 26.h,
                        width: 26.w,
                      ),
                    ),
                    Utils.horizontalSpace(10.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushNamed(RouteNames.notificationScreen);
                      },
                      child:  CustomImage(
                        path: KImages.notification,
                        height: 26.h,
                        width: 26.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
