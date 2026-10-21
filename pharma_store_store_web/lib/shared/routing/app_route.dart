import 'package:flutter/material.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/1-login_screen/login_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/2-forget_password_screens/changed_password_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/2-forget_password_screens/forget_password_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/2-forget_password_screens/reset_password_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/2-forget_password_screens/verify_phone_number_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/account_created_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/basic_details_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/lincense_and_verification_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/location_details_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/security_derails_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginScreenRoute':
        return LoginScreen.route();
      case 'ForgetPasswordScreenRoute':
        return ForgetPasswordScreen.route();
      case 'VerifyPhoneNumberScreenRoute':
        return VerifyPhoneNumberScreen.route();
      case 'ResetPasswordScreenRoute':
        return ResetPasswordScreen.route();
      case 'ChangedPasswordScreenRoute':
        return ChangedPasswordScreen.route();
      case 'BasicDetailsScreenRoute':
        return BasicDetailsScreen.route();
      case 'LocationDetailsScreenRoute':
        return LocationDetailsScreen.route();
      case 'LicenseAndVerificationScreenRoute':
        return LicenseAndVerificationScreen.route();
      case 'SecurityDerailsScreenRoute':
        return SecurityDerailsScreen.route();
      case 'AccountCreatedScreenRoute':
        return AccountCreatedScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
