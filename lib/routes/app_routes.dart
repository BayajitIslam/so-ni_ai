import 'package:get/get_navigation/get_navigation.dart';
import 'package:template/features/auth/bindings/forgot_password_binding.dart';
import 'package:template/features/auth/bindings/otp_binding.dart';
import 'package:template/features/auth/bindings/password_reset_binding.dart';
import 'package:template/features/auth/bindings/sign_in_binding.dart';
import 'package:template/features/auth/bindings/sign_up_binding.dart';
import 'package:template/features/auth/screens/account_create_successfull.dart';
import 'package:template/features/auth/screens/forgot_password_screen.dart';
import 'package:template/features/auth/screens/otp_screen.dart';
import 'package:template/features/auth/screens/password_reset_screen.dart';
import 'package:template/features/auth/screens/sign_in_screen.dart';
import 'package:template/features/auth/screens/sign_up_screen.dart';
import 'package:template/features/home/bindings/home_binding.dart';
import 'package:template/features/home/screens/home_screens.dart';
import 'package:template/routes/routes_name.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.sigunUp,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      binding: SignUpBinding(),
    ),
    GetPage(
      name: RoutesName.signin,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
      binding: SignInBinding(),
    ),
    GetPage(
      name: RoutesName.forgotPassword,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: RoutesName.otpScreen,
      page: () => OtpScreen(),
      transition: Transition.rightToLeft,
      binding: OtpBinding(),
    ),
    GetPage(
      name: RoutesName.passwordReset,
      page: () => PasswordResetScreen(),
      transition: Transition.rightToLeft,
      binding: PasswordResetBinding(),
    ),

    GetPage(
      name: RoutesName.accountCreatedSuccessfull,
      page: () => AccountCreateSuccessfull(),
      transition: Transition.rightToLeft,
    ),
  ];
}
