import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubscriptionController extends GetxController {
  // Observable variable for selected plan
  var selectedPlan = 'Yearly'.obs;

  // Method to update selected plan
  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
}