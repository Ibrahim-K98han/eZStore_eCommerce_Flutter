import 'package:flutter/material.dart';
import '../presentation/authentications/authentication_with_pass_screen.dart';
import '../presentation/authentications/authentications_screen.dart';
import '../presentation/authentications/create_new_pass_scree.dart';
import '../presentation/authentications/forgot_password_scree.dart';
import '../presentation/authentications/password_success_scree.dart';
import '../presentation/authentications/register_screen.dart';
import '../presentation/authentications/verify_email_scree.dart';
import '../presentation/authentications/verify_phone_number_scree.dart';
import '../presentation/main_screen/main_screen.dart';
import '../presentation/onboard_screen/onboard_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';

class RouteNames {
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String authenticationsScreen = '/authenticationsScreen';
  static const String authenticationWithPassScreen =
      '/authenticationWithPassScreen';
  static const String registerScreen = '/registerScreen';
  static const String verifyPhoneNumberScree = '/verifyPhoneNumberScree';
  static const String forgotPasswordScree = '/forgotPasswordScree';
  static const String verifyEmailScree = '/verifyEmailScree';
  static const String createNewPassScree = '/createNewPassScree';
  static const String passwordSuccessScree = '/passwordSuccessScree';
  static const String mainScreen = '/mainScreen';

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

      case RouteNames.registerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterScreen(),
        );

      case RouteNames.verifyPhoneNumberScree:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const VerifyPhoneNumberScree(),
        );

      case RouteNames.forgotPasswordScree:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotPasswordScree(),
        );

      case RouteNames.verifyEmailScree:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const VerifyEmailScree(),
        );

      case RouteNames.createNewPassScree:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CreateNewPassScree(),
        );
      case RouteNames.passwordSuccessScree:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PasswordSuccessScree(),
        );
        case RouteNames.mainScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainScreen(),
        );

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
