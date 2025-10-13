import 'package:flutter/material.dart';
import '../presentation/authentications/authentication_with_pass_screen.dart';
import '../presentation/authentications/authentications_screen.dart';
import '../presentation/onboard_screen/onboard_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';

class RouteNames {
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String authenticationsScreen = '/authenticationsScreen';
  static const String authenticationWithPassScreen =
      '/authenticationWithPassScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String otpScreen = '/otpScreen';
  static const String forgotPasswordOtpScreen = '/forgotPasswordOtpScreen';
  static const String newPasswordScreen = '/newPasswordScreen';
  static const String mainScreen = '/mainScreen';
  static const String homeScreen = '/homeScreen';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnBoardingScreen(),
        );

      case RouteNames.authenticationsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AuthenticationScreen(),
        );

      case RouteNames.authenticationWithPassScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AuthenticationWithPassScreen(),
        );

      //   case RouteNames.forgotPasswordScreen:
      //     return MaterialPageRoute(
      //         settings: settings, builder: (_) => const ForgotPasswordScreen());
      //
      //   case RouteNames.otpScreen:
      //     return MaterialPageRoute(
      //         settings: settings, builder: (_) => const OtpScreen());
      //
      //
      //   case RouteNames.newPasswordScreen:
      //     return MaterialPageRoute(
      //         settings: settings, builder: (_) => const NewPasswordScreen());
      //
      //   case RouteNames.mainScreen:
      //     return MaterialPageRoute(
      //         settings: settings, builder: (_) => const MainScreen());
      //
      //   case RouteNames.homeScreen:
      //     return MaterialPageRoute(
      //         settings: settings, builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('No Route Found ${settings.name}')),
              ),
        );
    }
  }
}
