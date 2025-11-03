// Main Screen Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/home/controllers/chatbot_controller.dart';
import 'package:template/features/home/models/message_model.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final controller = Get.put(ChatbotController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5DDB8),
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            Container(
              decoration: BoxDecoration(
                color: AppColors.yellowishLightOrange,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(153, 151, 151, 0.4),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back button
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,

                      size: 22.sp,
                    ),
                    onPressed: () => Get.back(),
                  ),

                  //title
                  Text(
                    'AI COACH',
                    style: AppTextStyles.s16w5M(
                      fontSize: 20,
                      fontweight: FontWeight.w600,
                    ),
                  ),

                  //  action Button
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/messageBot.svg",
                      height: 22.h,
                      width: 22.w,
                    ),
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.refresh),
                                title: Text('Clear Chat'),
                                onTap: () {
                                  controller.messages.clear();
                                  controller.onInit();
                                  Get.back();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text('Settings'),
                                onTap: () {
                                  Get.back();
                                  Get.snackbar(
                                    'Settings',
                                    'Settings coming soon!',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Messages List
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return _buildMessageBubble(message);
                  },
                ),
              ),
            ),

            // Typing Indicator
            Obx(
              () => controller.isTyping.value
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.w,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.smart_toy,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: [
                                _buildTypingDot(0),
                                SizedBox(width: 4.w),
                                _buildTypingDot(1),
                                SizedBox(width: 4.w),
                                _buildTypingDot(2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),

            // Quick Action Buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 6.h),
              child: Row(
                children: [
                  _buildQuickButton('log meals', controller),
                  SizedBox(width: 8.w),
                  _buildQuickButton('add water', controller),
                  SizedBox(width: 8.w),
                  _buildQuickButton('Workout Suggestion', controller),
                ],
              ),
            ),

            // Message Input
            Container(
              padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 12.h),
              decoration: BoxDecoration(color: const Color(0xFFF5DDB8)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 51.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.yellowishLightOrange,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(153, 151, 151, 0.4),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.messageController,
                              decoration: InputDecoration(
                                hintText: 'Aa',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16.sp,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              onSubmitted: (text) =>
                                  controller.sendMessage(text),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () => controller.sendMessage(
                              controller.messageController.text,
                            ),
                            child: Icon(
                              Icons.send_outlined,
                              color: Colors.grey[600],
                              size: 24.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, double value, child) {
        return Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3 + (value * 0.7)),
            shape: BoxShape.circle,
          ),
        );
      },
      onEnd: () {},
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (message.time != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Center(
                child: Text(
                  message.time!,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: message.isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: message.isUser
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              if (!message.isUser) ...[
                Container(
                  width: 32.w,
                  height: 32.w,
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.smart_toy,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
              ],
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? const Color(0xFF61584c)
                        : AppColors.yellowishLightOrange,
                    borderRadius: BorderRadius.circular(18.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(153, 151, 151, 0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: message.isUser && message.text == "Show me daily"
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              message.text,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ],
                        )
                      : Text(
                          message.text,
                          style: GoogleFonts.montserratAlternates(
                            color: message.isUser ? Colors.white : Colors.black,
                            fontSize: 14.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              if (message.isUser) ...[
                Container(
                  width: 32.w,
                  height: 32.w,
                  margin: EdgeInsets.only(left: 8.w),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, color: Colors.white, size: 18.sp),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButton(String text, ChatbotController controller) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.sendQuickMessage(text),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.yellowishOrange,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(153, 151, 151, 0.4),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: AppTextStyles.s16w5M(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
