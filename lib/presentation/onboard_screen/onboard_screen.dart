import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';
import 'data/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late int _numPages;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _numPages = data.length;
    _pageController = PageController(initialPage: _currentPage);
  }

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomImage(
            path: KImages.onboardBg,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSkipButton(),
                _buildImagesSlider(),
                Utils.verticalSpace(size.height * 0.05),
                _buildContent(),

                Utils.verticalSpace(32.h),
                Padding(
                  padding: Utils.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDotIndicator(),
                      ElevatedButton(
                        onPressed: () {
                          if (_currentPage == data.length - 1) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteNames.authenticationsScreen,
                              (route) => false,
                            );
                          } else {
                            _pageController.nextPage(
                              duration: kDuration,
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(52, 52),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                          backgroundColor: Color(0xFFE43131),
                        ),
                        child: const Icon(
                          Icons.arrow_forward, // or any icon you want
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesSlider() {
    return Container(
      height: size.height * 0.4,
      padding: Utils.all(value: 4.0),
      child: PageView(
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: data.map((e) => CustomImage(path: e.image)).toList(),
      ),
    );
  }

  Widget _buildContent() {
    return AnimatedSwitcher(
      duration: kDuration,
      transitionBuilder: (Widget child, Animation<double> anim) {
        return FadeTransition(opacity: anim, child: child);
      },
      child: getContent(),
    );
  }

  Widget getContent() {
    final item = data[_currentPage];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: ValueKey('$_currentPage'),
        children: [
          CustomText(
            text: item.title,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: tTextColor,
          ),
          Utils.verticalSpace(16.0),
          CustomText(text: item.subTitle, color: sTextColor, fontSize: 16.sp),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(data.length, (index) {
        final i = _currentPage == index;
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: Utils.vSize(6.0),
          width: Utils.hSize(i ? 24.0 : 6.0),
          margin: Utils.only(right: 4.0),
          decoration: BoxDecoration(
            color: i ? Color(0xFFE43131) : Color(0xFFE43131).withOpacity(0.2),
            borderRadius: BorderRadius.circular(i ? 50.0 : 5.0),
            //shape: i ? BoxShape.rectangle : BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildSkipButton() {
    return Row(
      children: [
        const Spacer(),
        // CustomImage(
        //   path: KImages.appLogo,
        //   height: Utils.vSize(80.0),
        //   width: Utils.vSize(100.0),
        // ),
        const Spacer(),
        GestureDetector(
          onTap:
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.authenticationsScreen,
                (route) => false,
              ),
          child: Padding(
            padding: EdgeInsets.only(right: 20.w, bottom: 20.h),
            child: CustomText(
              text: 'Skip',
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: textColor,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
