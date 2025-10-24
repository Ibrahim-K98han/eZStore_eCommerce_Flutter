import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/utils/utils.dart';
import 'package:ezstore/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedCountry = 'us';

  final Map<String, Map<String, String>> countries = {
    'us': {'flag': '🇺🇸', 'name': 'United States'},
    'uk': {'flag': '🇬🇧', 'name': 'United Kingdom'},
    'ca': {'flag': '🇨🇦', 'name': 'Canada'},
    'bd': {'flag': '🇧🇩', 'name': 'Bangladesh'},
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Language",
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
            CustomText(text: 'Select Langauge'),
            Utils.verticalSpace(8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Color(0xffF8FAFC),
                border: Border.all(color: borderColor),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCountry,
                  isDense: true,
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.grey.shade700,
                    size: 16.sp,
                  ),
                  items:
                      countries.entries.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Row(
                            children: [
                              Text(
                                entry.value['flag']!,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                entry.value['name']!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() => selectedCountry = newValue);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
