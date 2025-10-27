import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// PLACEHOLDERS: Replace with your actual imports
import 'package:template/core/constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  // Pass the current selected index and a callback function
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  // Define your navigation icons and their corresponding indexes
  final List<String> navIcons = const [
    "assets/icons/Home Angle 2.svg",
    "assets/icons/chicken.svg",
    "assets/icons/diary_re.svg",
    "assets/icons/chatbot.svg",
    "assets/icons/workout (1).svg",
    "assets/icons/navUser.svg",
  ];

  // NOTE: I am using standard Material Icons for simplicity.
  // You would replace these with your custom icon assets or MyIcons.

  @override
  Widget build(BuildContext context) {
    // 1. BottomAppBar: The rounded container
    return BottomAppBar(
      color: Colors.transparent, // Important: Use transparent here
      elevation: 0,
      child: Container(
        height: 80.h, // Height of the entire bar
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.yellowishLightOrange, // Light tan background color
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          // Add a slight shadow if needed
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.05),
          //     spreadRadius: 1,
          //     blurRadius: 10,
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Left three items
            ...List.generate(6, (index) => _buildNavItem(index)),

            // Spacer to create the FAB notch gap
            SizedBox(width: 50.w),
          ],
        ),
      ),
    );
  }

  // Helper method to build each icon button
  Widget _buildNavItem(int index) {
    final bool isSelected = index == selectedIndex;
    // Correct index for the 4th and 5th items
    final iconIndex = index;

    // Define the icon color based on selection
    final Color iconColor = isSelected
        ? AppColors
              .brandText // White icon when active
        : AppColors.black;

    return Expanded(
      child: GestureDetector(
        onTap: () => onItemTapped(iconIndex),
        child: Container(
          // Set minimum dimensions for the circular/rounded background
          width: 50.w,
          height: 50.h,
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
