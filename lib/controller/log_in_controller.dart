import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/login_response.dart';
import 'package:foodie/view/auth/verification_page.dart';
import 'package:foodie/view/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LogInController extends GetxController {
  final box = GetStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  Future<void> userLogin(String data) async {
    setLoading = true;
    Uri url = Uri.parse('$appBaseUrl/login');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response.statusCode == 200) {
        LoginResponseModel data = loginResponseModelFromJson(response.body);
        String userId = data.id;
        String userData = jsonEncode(data);

        await box.write(userId, userData);
        await box.write('token', data.userToken);
        await box.write('userId', data.id);
        await box.write('verification', data.verification);

        setLoading = false;

        Get.snackbar(
          'Enjoy',
          'You are logged in successfully',
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Ionicons.fast_food_outline),
        );

        if (data.verification == false) {
          Get.offAll(
            () => const VerificationPage(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
          );
        }

        if (data.verification == true) {
          Get.offAll(
            () => const MainScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
          );
        }
      } else {
        setLoading = false;
        ApiError error = apiErrorFromJson(response.body);
        Get.snackbar(
          'Faileed to login',
          error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }

  Future<void> logout() async {
    await box.erase();
    Get.offAll(
      () => const MainScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
    );
  }

  LoginResponseModel? getUserInfo() {
    String? userId = box.read('userId');
    String? data;
    if (userId != null) {
      data = box.read(userId);
    }
    if (data != null) {
      return loginResponseModelFromJson(data);
    }
    return null;
  }
}
