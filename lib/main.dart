import 'dart:ui';

import 'package:ezstore/routes/route_names.dart';
import 'package:ezstore/utils/constraints.dart';
import 'package:ezstore/widgets/custom_theme.dart';
import 'package:ezstore/widgets/fetch_error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final logicalSize = window.physicalSize / window.devicePixelRatio;
    final double height = logicalSize.height;

    // Conditional design size
    final designSize = height >= 950
        ? const Size(475.0, 1012.0)
        : const Size(375.0, 812.0);

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: RouteNames.generateRoutes,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: FetchErrorText(
                text: 'No route defined for ${settings.name}',
                textColor: redColor,
              ),
            ),
          );
        },
        theme: MyTheme.theme,
      ),
    );
  }
}
