// import 'dart:convert'; // <-- add this
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ScanController extends GetxController {
//   var imagePath = "";
//   var isLoading = false.obs;
//   var scanResult = <String, dynamic>{}.obs;
//   var recipeList = <String, dynamic>{}.obs;
//   var detectedIngredients = <String, dynamic>{}.obs;
//   final itemController = TextEditingController();
// }

//   final profileController = Get.put(ProfileController());

//   Future<void> scanIngredients() async {
//     isLoading.value = true;
//     // final token = AppStorage.read(AppStrings.accessToken);

//     if (token == null) {
//       throw Exception("No access token found");
//     }

//     if (imagePath.isEmpty) {
//       throw Exception("No image selected");
//     }

//     try {
//       var uri = Uri.parse(Endpoints.SCAN_INGREDIENTS);

//       var request = http.MultipartRequest('POST', uri);
//     //   request.headers['Authorization'] = "Bearer $token";

//       // Add file
//       request.files.add(await http.MultipartFile.fromPath('file', imagePath));

//       // Send request
//       http.StreamedResponse response = await request.send();
//       var respStr = await response.stream.bytesToString();

//       Get.snackbar("Response", response.statusCode.toString());
//       if (response.statusCode == 200) {
//         // Decode JSON to Map
//         final decoded = jsonDecode(respStr) as Map<String, dynamic>;
//         scanResult.value = decoded;
//         profileController.getUserinfo();
//         print(scanResult);
//         getBasket();
//       } else {
//         isLoading.value = false;
//         scanResult.value = {
//           "error": "Failed",
//           "status": response.statusCode,
//           "reason": response.reasonPhrase,
//         };
//       }
//     } catch (e) {
//       scanResult.value = {"error": e.toString()};
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> generateRecipe() async {
//     final token = AppStorage.read(AppStrings.accessToken);

//     if (token == null) {
//       throw Exception("No access token found");
//     }

//     try {
//       isLoading.value = true;

//       final url = Uri.parse(Endpoints.GENERATE_RECIPE);

//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         body: jsonEncode({'use_basket': true}),
//       );

//       print("Generate recipe response: ${response.body}");

//       if (response.statusCode == 200) {
//         final decoded = jsonDecode(response.body);

//         if (decoded is Map<String, dynamic>) {
//           recipeList.value = decoded;
//         } else {
//           // if API returns a list, wrap it into a map
//           recipeList.value = {"recipes": decoded};
//         }
//       } else {
//         recipeList.value = {
//           "error": "Failed",
//           "status": response.statusCode,
//           "reason": response.reasonPhrase,
//         };
//       }
//     } catch (e) {
//       recipeList.value = {"error": e.toString()};
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> getBasket() async {
//     final url = Uri.parse(Endpoints.BASKET);

//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           'Authorization': "Bearer ${AppStorage.read(AppStrings.accessToken)}",
//           'Content-type': "application/json",
//         },
//       );

//       if (response.statusCode == 200) {
//         final decoded = jsonDecode(response.body);

//         // Clear if there are no items
//         if (decoded["items"] != null && (decoded["items"] as List).isNotEmpty) {
//           detectedIngredients.value = decoded;
//         } else {
//           detectedIngredients.value = {"items": []};
//         }

//         print("Detected ingredients: $detectedIngredients");
//       } else {
//         // Clear on error
//         detectedIngredients.value = {"items": []};
//         print("Something went wrong");
//       }
//     } catch (e) {
//       // Clear on exception
//       detectedIngredients.value = {"items": []};
//       print(e);
//     }
//   }

//   Future<void> deleteIngredientsById(int id) async {
//     final url = Uri.parse(Endpoints.DELETE_DETECTED_INGREDIENT);
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': "Bearer ${AppStorage.read(AppStrings.accessToken)}",
//           'Content-type': "application/json",
//         },
//         body: jsonEncode({'basket_item_id': id}),
//       );

//       print("Delete response: ${response.statusCode} -> ${response.body}");

//       if (response.statusCode == 200) {
//         await getBasket(); // refresh basket
//         Get.snackbar("Success", "Item removed");
//       } else {
//         Get.snackbar("Error", "Failed to remove item");
//       }
//     } catch (e) {
//       print(e);
//       Get.snackbar("Error", "Something went wrong");
//     }
//   }

//   Future<void> clearBasket() async {
//     final url = Uri.parse(Endpoints.CLEAR_BASKET);

//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': "Bearer ${AppStorage.read(AppStrings.accessToken)}",
//           'Content-type': "application/json",
//         },
//         body: jsonEncode({'session_id': ""}),
//       );

//       if (response.statusCode == 200) {
//         print("basket cleared successfully");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> addIngredientsManually() async {
//     final url = Uri.parse(Endpoints.BASKET);
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': "Bearer ${AppStorage.read(AppStrings.accessToken)}",
//           'Content-type': "application/json",
//         },
//         body: jsonEncode({'ingredients': itemController.text.toString()}),
//       );

//       if (response.statusCode == 200) {
//         getBasket();
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
