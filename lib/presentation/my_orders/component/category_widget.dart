import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int _currentIndex = 0;

  List<String> category = [
    'View All',
    'To Pay',
    'To Ship',
    'Shipped',
    'Returns',
    'Review',
    'Summer',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  duration: Duration(seconds: 0),
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
    );
  }
}
