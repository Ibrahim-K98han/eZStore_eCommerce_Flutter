import 'package:ezstore/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int _currentIndex = 0;

  List<String> category = [
    'All',
    'Women',
    'Sports',
    'Men',
    'Shoes',
    'Curve',
    'Summer',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(category.length, (index) {
                final active = _currentIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _currentIndex = index),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              active
                                  ? const Color(0xFFE43131)
                                  : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    duration:  Duration(seconds: 0),
                    padding: Utils.symmetric(v: 8.0, h: 14.0),
                    child: CustomText(
                      text: category[index],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF334155),
                    ),
                  ),
                );
              }),
            ),
          ),

        ],
      ),
    );
  }
}
