import 'package:ezstore/presentation/coupons/coupons_screen.dart';
import 'package:ezstore/presentation/gift_and_wallet/gift_and_wallet_screen.dart';
import 'package:ezstore/presentation/gift_and_wallet/gift_card_screen.dart';
import 'package:ezstore/presentation/my_orders/my_order_screen.dart';
import 'package:ezstore/presentation/my_orders/write_review_screen.dart';
import 'package:ezstore/presentation/my_review/my_review_screen.dart';
import 'package:ezstore/presentation/product_details/component/shipping_policy_screen.dart';
import 'package:ezstore/presentation/profile_screen/account_delete_screen.dart';
import 'package:ezstore/presentation/profile_screen/add_new_shipping_address_screen.dart';
import 'package:ezstore/presentation/profile_screen/change_password_screen.dart';
import 'package:ezstore/presentation/profile_screen/currency_screen.dart';
import 'package:ezstore/presentation/profile_screen/device_manager_screen.dart';
import 'package:ezstore/presentation/profile_screen/email_notification_screen.dart';
import 'package:ezstore/presentation/profile_screen/history_screen.dart';
import 'package:ezstore/presentation/profile_screen/language_screen.dart';
import 'package:ezstore/presentation/profile_screen/notification_settings_screen.dart';
import 'package:ezstore/presentation/profile_screen/push_notification_screen.dart';
import 'package:ezstore/presentation/profile_screen/shipping_address_screen.dart';
import 'package:ezstore/presentation/profile_screen/shipping_method_screen.dart';
import 'package:ezstore/presentation/search/search_screen.dart';
import 'package:ezstore/presentation/search/shop_filter_screen.dart';
import 'package:ezstore/presentation/support_ticket/my_support_ticket_screen.dart';
import 'package:ezstore/presentation/support_ticket/question_screen.dart';
import 'package:ezstore/presentation/support_ticket/support_response_screen.dart';
import 'package:ezstore/presentation/support_ticket/support_ticket_screen.dart';
import 'package:ezstore/presentation/terms_and_condition/app_info_screen.dart';
import 'package:ezstore/presentation/terms_and_condition/privacy_policy_screen.dart';
import 'package:ezstore/presentation/terms_and_condition/terms_and_condition_screen.dart';
import 'package:flutter/material.dart';
import '../presentation/all_cart/all_cart_screen.dart';
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
import '../presentation/order_confirm/order_confirm_screen.dart';
import '../presentation/order_tracking/order_tracking_screen.dart';
import '../presentation/product_details/product_details_screen.dart';
import '../presentation/notification/notification_screen.dart';
import '../presentation/profile_screen/my_profile_screen.dart';
import '../presentation/profile_screen/settings_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/wishlist_screen/wishlist_with_select_screen.dart';

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
  static const String searchScreen = '/searchScreen';
  static const String productDetailsScreen = '/productDetailsScreen';
  static const String allCartScreen = '/allCartScreen';
  static const String orderConfirmScreen = '/orderConfirmScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String myOrderScreen = '/myOrderScreen';
  static const String wishlistWithSelectScreen = '/wishlistWithSelectScreen';
  static const String orderTrackingScreen = '/orderTrackingScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String myProfileScreen = '/myProfileScreen';
  static const String shopFilterScreen = '/shopFilterScreen';
  static const String shippingPolicyScreen = '/shippingPolicyScreen';
  static const String shippingMethodScreen = '/shippingMethodScreen';
  static const String shippingAddressScreen = '/shippingAddressScreen';
  static const String addNewShippingAddressScreen =
      '/addNewShippingAddressScreen';
  static const String writeReviewScreen = '/writeReviewScreen';
  static const String couponsScreen = '/couponsScreen';
  static const String giftAndWalletScreen = '/giftAndWalletScreen';
  static const String giftCardScreen = '/giftCardScreen';
  static const String historyScreen = '/historyScreen';
  static const String supportTicketScreen = '/supportTicketScreen';
  static const String mySupportTicketScreen = '/mySupportTicketScreen';
  static const String supportResponseScreen = '/supportResponseScreen';
  static const String questionScreen = '/questionScreen';
  static const String termsAndConditionScreen = '/termsAndConditionScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String appInfoScreen = '/appInfoScreen';
  static const String myReviewScreen = '/myReviewScreen';
  static const String languageScreen = '/languageScreen';
  static const String currencyScreen = '/currencyScreen';
  static const String notificationSettingsScreen = '/notificationSettingsScreen';
  static const String pushNotificationScreen = '/pushNotificationScreen';
  static const String emailNotificationScreen = '/emailNotificationScreen';
  static const String deviceManagerScreen = '/deviceManagerScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String accountDeleteScreen = '/accountDeleteScreen';

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
      case RouteNames.searchScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SearchScreen(),
        );
      case RouteNames.productDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProductDetailScreen(),
        );
      case RouteNames.allCartScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AllCartScreen(),
        );
      case RouteNames.orderConfirmScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OrderConfirmScreen(),
        );
      case RouteNames.notificationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationScreen(),
        );
      case RouteNames.myOrderScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyOrderScreen(),
        );
      case RouteNames.wishlistWithSelectScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const WishlistWithSelectScreen(),
        );
      case RouteNames.orderTrackingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OrderTrackingScreen(),
        );
      case RouteNames.settingsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case RouteNames.myProfileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyProfileScreen(),
        );
      case RouteNames.shopFilterScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShopFilterScreen(),
        );
      case RouteNames.shippingPolicyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShippingPolicyScreen(),
        );
      case RouteNames.shippingMethodScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShippingMethodScreen(),
        );
      case RouteNames.shippingAddressScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShippingAddressScreen(),
        );
      case RouteNames.addNewShippingAddressScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddNewShippingAddressScreen(),
        );
      case RouteNames.writeReviewScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const WriteReviewScreen(),
        );
      case RouteNames.couponsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CouponsScreen(),
        );
      case RouteNames.giftAndWalletScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GiftAndWalletScreen(),
        );
      case RouteNames.giftCardScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GiftCardScreen(),
        );
      case RouteNames.historyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HistoryScreen(),
        );
      case RouteNames.supportTicketScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SupportTicketScreen(),
        );
      case RouteNames.mySupportTicketScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MySupportTicketScreen(),
        );
      case RouteNames.supportResponseScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SupportResponseScreen(),
        );
      case RouteNames.questionScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const QuestionScreen(),
        );
      case RouteNames.termsAndConditionScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TermsAndConditionScreen(),
        );
      case RouteNames.privacyPolicyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case RouteNames.appInfoScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AppInfoScreen(),
        );
      case RouteNames.myReviewScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyReviewScreen(),
        );
      case RouteNames.languageScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LanguageScreen(),
        );
      case RouteNames.currencyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CurrencyScreen(),
        );
      case RouteNames.notificationSettingsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationSettingsScreen(),
        );
      case RouteNames.pushNotificationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PushNotificationScreen(),
        );
      case RouteNames.emailNotificationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EmailNotificationScreen(),
        );
      case RouteNames.deviceManagerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DeviceManagerScreen(),
        );
      case RouteNames.changePasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChangePasswordScreen(),
        );
      case RouteNames.accountDeleteScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AccountDeleteScreen(),
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
