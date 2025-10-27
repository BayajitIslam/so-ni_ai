import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/features/home/screens/ai_generated_meal_recommendations_screen.dart';
import 'package:template/features/home/screens/chatbot_screen.dart';
import 'package:template/features/home/screens/diary_screen.dart';
import 'package:template/features/home/screens/home_screens.dart';
import 'package:template/features/home/screens/profile_screen.dart';
import 'package:template/features/home/screens/workout_screen.dart';
import 'package:template/features/home/widgets/custome_navbar.dart';
import 'package:template/routes/routes_name.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //pages list
  final List<Widget> pages = [
    HomeScreen(),
    AiGeneratedMealRecommendationsScreen(),
    DiaryScreen(),
    ChatbotScreen(),
    WorkoutScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Content
      body: pages[_currentIndex],

      //Floating Action Bar
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15.w, top: 15.h),
        child: FloatingActionButton(
          onPressed: () {
            // Handle Camera/Quick Action click
            Get.toNamed(RoutesName.foodScannerCamaraScreen);
          },
          elevation: 0,
          backgroundColor: AppColors.buttonBg, // Dark brown color
          shape: const CircleBorder(),
          child: Icon(
            Icons.camera_alt_outlined,
            color: AppColors.white, // White icon
            size: 28.sp,
          ),
        ),
      ),

      // Position the FAB in the center notch
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

      //Botton Nave
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
