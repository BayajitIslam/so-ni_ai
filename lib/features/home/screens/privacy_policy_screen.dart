import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Privacy And Policy
              Text(
                "Privacy And Policy",
                style: AppTextStyles.s16w5P(
                  fontweight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 20.h),
              // Introduction
              _buildParagraph(
                'Welcome To [Your App Name] ("We", "Our", "Us"). Your Privacy Is Important To Us. This Privacy Policy Explains How We Collect, Use, And Protect Your Information When You Use Our Mobile Application [Your App Name] (The "App").',
              ),
              SizedBox(height: 16.h),

              // Section 1
              _buildSectionTitle('1. Information We Collect'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'We May Collect The Following Types Of Information:',
              ),
              SizedBox(height: 8.h),

              _buildSubsectionTitle('A. Personal Information'),
              SizedBox(height: 4.h),
              _buildParagraph(
                'When You Register Or Use Certain Features, We May Ask For:',
              ),
              SizedBox(height: 4.h),
              _buildBulletPoint('Name'),
              _buildBulletPoint('Email Address'),
              _buildBulletPoint('Phone Number (Optional)'),
              _buildBulletPoint('Other Information You Voluntarily Provide'),
              SizedBox(height: 12.h),

              _buildSubsectionTitle('B. Non-Personal Information'),
              SizedBox(height: 4.h),
              _buildParagraph('We May Automatically Collect:'),
              SizedBox(height: 4.h),
              _buildBulletPoint(
                'Device Information (Model, OS Version, Unique Identifiers)',
              ),
              _buildBulletPoint(
                'Log Data (IP Address, App Usage, Crash Reports)',
              ),
              _buildBulletPoint('Cookies Or Similar Tracking Technologies'),
              _buildBulletPoint('Location Data (If Applicable)'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'If You Enable Location Services, We May Collect Your Device\'s Location To Provide Features Such As [E.G., Nearby Results, Personalized Content, Etc.].',
              ),
              SizedBox(height: 8.h),
              _buildParagraph(
                'You Can Disable Location Access Anytime From Your Device Settings.',
              ),
              SizedBox(height: 16.h),

              // Section 2
              _buildSectionTitle('2. How We Use Your Information'),
              SizedBox(height: 8.h),
              _buildParagraph('We Use Your Information To:'),
              SizedBox(height: 4.h),
              _buildBulletPoint('Provide, Maintain, And Improve The App'),
              _buildBulletPoint('Personalize User Experience'),
              _buildBulletPoint(
                'Respond To Your Inquiries And Provide Customer Support',
              ),
              _buildBulletPoint(
                'Send Important Updates, Security Alerts, Or Administrative Messages',
              ),
              SizedBox(height: 16.h),

              // Section 3
              _buildSectionTitle('3. How We Share Your Information'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'We Do Not Sell Your Personal Information. However, We May Share Your Data With:',
              ),
              SizedBox(height: 4.h),
              _buildBulletPoint(
                'Service Providers: Third-party vendors who help us operate the app (e.g., hosting, analytics)',
              ),
              _buildBulletPoint(
                'Legal Requirements: If required by law or to protect our rights',
              ),
              _buildBulletPoint(
                'Business Transfers: In case of merger, acquisition, or sale',
              ),
              SizedBox(height: 16.h),

              // Section 4
              _buildSectionTitle('4. Data Security'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'We Use Industry-Standard Security Measures To Protect Your Information. However, No Method Of Transmission Over The Internet Is 100% Secure.',
              ),
              SizedBox(height: 16.h),

              // Section 5
              _buildSectionTitle('5. Your Rights'),
              SizedBox(height: 8.h),
              _buildParagraph('You Have The Right To:'),
              SizedBox(height: 4.h),
              _buildBulletPoint(
                'Access, Update, Or Delete Your Personal Information',
              ),
              _buildBulletPoint('Opt-Out Of Marketing Communications'),
              _buildBulletPoint('Disable Location Services'),
              _buildBulletPoint('Request A Copy Of Your Data'),
              SizedBox(height: 16.h),

              // Section 6
              _buildSectionTitle('6. Children\'s Privacy'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'Our App Is Not Intended For Users Under 13. We Do Not Knowingly Collect Information From Children.',
              ),
              SizedBox(height: 16.h),

              // Section 7
              _buildSectionTitle('7. Changes To This Policy'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'We May Update This Privacy Policy From Time To Time. We Will Notify You Of Significant Changes Via The App Or Email.',
              ),
              SizedBox(height: 16.h),

              // Section 8
              _buildSectionTitle('8. Contact Us'),
              SizedBox(height: 8.h),
              _buildParagraph(
                'If You Have Questions About This Privacy Policy, Please Contact Us At:',
              ),
              SizedBox(height: 8.h),
              _buildParagraph('Email: support@yourapp.com'),
              _buildParagraph('Phone: +1 (123) 456-7890'),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSubsectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13.sp,
        height: 1.5,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                height: 1.5,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
