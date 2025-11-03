import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/routes/routes_name.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final BuildContext context; // Context add korlam navigation er jonno

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.context, // Required context
  });

  final List<String> navIcons = const [
    "assets/icons/Home Angle 2.svg",
    "assets/icons/chicken.svg",
    "assets/icons/diary_re.svg",
    "assets/icons/chatbot.svg",
    "assets/icons/workout (1).svg",
    "assets/icons/navUser.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.yellowishLightOrange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(6, (index) => _buildNavItem(index)),
            SizedBox(width: 50.w),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = index == selectedIndex;
    final iconIndex = index;

    final Color iconColor = isSelected ? AppColors.brandText : AppColors.black;

    return Expanded(
      child: InkWell(
        enableFeedback: true,
        focusColor: AppColors.fire,
        onTap: () {
          // AI Coach button check (index 3 = chatbot icon)
          if (iconIndex == 3) {
            // Navbar chara navigate to AI Coach
            Get.toNamed(RoutesName.chatbotScreen);
          } else {
            // Normal navigation with navbar
            onItemTapped(iconIndex);
          }
        },
        child: Container(
          width: 80.w,
          height: 80.h,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            navIcons[index],
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
//  IconButton(
//         icon: Icon(
//           navIcons[iconIndex],
//           size: 22.sp,
//           color: selectedIndex == iconIndex
//               ? AppColors
//                     .brandText // Dark brown for selected
//               : AppColors.black,
//         ),
//         onPressed: () => onItemTapped(iconIndex),
//         // Exclude the space where the FAB is supposed to be if you have 5 icons total
//         // The spacer above handles the gap for the FAB.
//         enableFeedback: true,
//       ),

// --------------------------------------------------------------------------
// HOW TO INTEGRATE THIS INTO YOUR SCAFFOLD
// --------------------------------------------------------------------------

/*
// In your main Scaffold (e.g., in a MainScreen widget):

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Add navigation logic here (e.g., change the body content)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Allows the body to go behind the custom bottom bar
      
      // The floating action button (Camera Icon)
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          // Handle Camera/Quick Action click
        },
        backgroundColor: AppColors.buttonBg, // Dark brown color
        shape: const CircleBorder(),
        child: Icon(
          Icons.camera_alt_outlined, 
          color: AppColors.white, // White icon
          size: 28.sp,
        ),
      ),
      
      // Position the FAB in the center notch
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // The custom navigation bar
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
      
      body: Center(
        child: Text('Content for Tab $_currentIndex'),
      ),
    );
  }
}
*/
