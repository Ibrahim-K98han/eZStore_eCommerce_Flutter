import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/k_images.dart';
import '../../routes/route_names.dart';
import '../../widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotToNext();
  }

  gotToNext() {
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.onBoardingScreen, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Transform.rotate(
                angle: 180 * 3.1415926535 / 180, // 🔄 180-degree rotation
                child: CustomImage(
                  path: KImages.onboardBg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
            child: CustomImage(
              width: 160.w,
              height: 40.h,
              path: KImages.logoWithText,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),

    );
  }
}
