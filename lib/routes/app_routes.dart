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
import 'package:template/features/home/screens/chatbot_screen.dart';
import 'package:template/features/home/screens/diary_screen.dart';
import 'package:template/features/home/screens/food_screen.dart';
import 'package:template/features/home/screens/home_nav.dart';
import 'package:template/features/home/screens/camara/camera_screen.dart';
import 'package:template/features/home/screens/workout_video_players_screen.dart';
import 'package:template/features/splash/bindings/height_selection_binding.dart';
import 'package:template/features/splash/bindings/splash_binding.dart';
import 'package:template/features/splash/bindings/subscription_binding.dart';
import 'package:template/features/splash/bindings/weight_selection_binding.dart';
import 'package:template/features/splash/screens/onboarding/onbaording1.dart';
import 'package:template/features/splash/screens/onboarding/onboarding2.dart';
import 'package:template/features/splash/screens/onboarding/onboarding3.dart';
import 'package:template/features/splash/screens/onboarding/onboarding4.dart';
import 'package:template/features/splash/screens/onboarding/splash_screen.dart';
import 'package:template/features/splash/screens/userselection/age_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/dietary_restriction_screen.dart';
import 'package:template/features/splash/screens/userselection/gender_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/height_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/language_selection.dart';
import 'package:template/features/splash/screens/userselection/lifestyle_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/primary_health_goal_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/profile_ready_screen.dart';
import 'package:template/features/splash/screens/userselection/specific_diet_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/subscription_screen.dart';
import 'package:template/features/splash/screens/userselection/weight_selection_screen.dart';
import 'package:template/features/splash/screens/userselection/whatsyourname_screen.dart';
import 'package:template/routes/routes_name.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesName.homeNavScreen,
      page: () => HomeNavScreen(),
      transition: Transition.rightToLeft,
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.sigunUp,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      bindings: [SignUpBinding(), OtpBinding()],
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

    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
      binding: SplashBinding(),
    ),

    GetPage(
      name: RoutesName.onboarding1,
      page: () => Onbaording1(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.onboarding2,
      page: () => Onboarding2(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.onboarding3,
      page: () => Onboarding3(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.onboarding4,
      page: () => Onboarding4(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.ageSelection,
      page: () => AgeSelectionScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.genderSelection,
      page: () => GenderSelectionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.heightSelection,
      page: () => HeightSelectionScreen(),
      transition: Transition.rightToLeft,
      binding: HeightSelectionBinding(),
    ),

    GetPage(
      name: RoutesName.weighttSelection,
      page: () => WeightSelectionScreen(),
      transition: Transition.rightToLeft,
      binding: WeightSelectionBinding(),
    ),
    GetPage(
      name: RoutesName.lifestyleSelectin,
      page: () => LifestyleSelectionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.primaryHealthGoal,
      page: () => PrimaryHealthGoalSelectionScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.specificDietSelectionScreen,
      page: () => SpecificDietSelectionScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.dietaryRestrictionScreen,
      page: () => DietaryRestrictionScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.languageSelection,
      page: () => LanguageSelection(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: RoutesName.subscriptionPages,
      page: () => SubscriptionPage(),
      transition: Transition.rightToLeft,
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: RoutesName.profileReady,
      page: () => ProfileReadyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.whatsYourName,
      page: () => WhatsyournameScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.foodScannerCamaraScreen,
      page: () => FoodScanCameraScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.foodScreen,
      page: () => FoodScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.diaryScreen,
      page: () => DiaryScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.chatbotScreen,
      page: () => ChatbotScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.workoutVideoPlayerScreen,
      page: () => WorkoutVideoPlayerScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
