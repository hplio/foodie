import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/success_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final box = GetStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  Future<void> userRegistration(String data) async {
    setLoading = true;
    Uri url = Uri.parse('$appBaseUrl/register');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response.statusCode == 201) {
        SuccessModel data = successModelFromJson(response.body);
        setLoading = false;
        Get.snackbar(
          'Enjoy',
          data.message,
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Ionicons.fast_food_outline),
        );
      } else {
        setLoading = false;
        ApiError error = apiErrorFromJson(response.body);
        Get.snackbar(
          'Faileed to resgister',
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
}
