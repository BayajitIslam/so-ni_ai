// GetX Controller
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/features/home/models/message_model.dart';

class ChatbotController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final RxList<Message> messages = <Message>[].obs;
  final RxBool isTyping = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initial AI message
    messages.add(
      Message(
        text:
            "👋 Hi there! Based on your fitness goals, I've prepared some AI-Generated Meal Recommendations for you. Would you like to see your daily or weekly meal plan?",
        isUser: false,
        time: "10:15",
      ),
    );
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Add user message
    messages.add(Message(text: text.trim(), isUser: true));

    messageController.clear();

    // Simulate AI typing
    isTyping.value = true;

    // Simulate AI response after delay
    Future.delayed(const Duration(seconds: 2), () {
      isTyping.value = false;

      // Generate AI response based on user input
      String aiResponse = _generateAiResponse(text.toLowerCase());

      messages.add(Message(text: aiResponse, isUser: false));
    });
  }

  String _generateAiResponse(String userMessage) {
    if (userMessage.contains('daily') ||
        userMessage.contains('show me daily')) {
      return "Great choice! 😊\nHere's your personalized meal plan for today:\n🥣 Breakfast: Oatmeal with banana & peanut butter\n🥗 Lunch: Grilled chicken salad with olive oil dressing\n🍽️ Dinner: Brown rice with salmon & steamed veggies\n💡 Bot: These meals are optimized for your goal: muscle gain 💪\nWould you like to add them to your Diary?\nUser: Yes, add to Diary.\nBot: ✅ Done! Meals added successfully.\nWant to replace or swap any meal?";
    } else if (userMessage.contains('weekly')) {
      return "Perfect! I'll prepare your weekly meal plan. This will include 7 days of personalized meals based on your fitness goals. Would you like me to proceed?";
    } else if (userMessage.contains('log meals')) {
      return "Sure! Please tell me what you ate today and I'll log it for you. 📝";
    } else if (userMessage.contains('water') ||
        userMessage.contains('add water')) {
      return "Great! How many glasses of water did you drink today? 💧";
    } else if (userMessage.contains('workout')) {
      return "Based on your fitness level, here are some workout suggestions:\n💪 Strength Training: 3x per week\n🏃 Cardio: 2x per week\n🧘 Flexibility: Daily stretching\nWould you like detailed exercises?";
    } else {
      return "Thanks for your message! I'm here to help with your fitness journey. You can ask me about meal plans, workouts, or tracking your progress! 💪";
    }
  }

  void sendQuickMessage(String text) {
    sendMessage(text);
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
