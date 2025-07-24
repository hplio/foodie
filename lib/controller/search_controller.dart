import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  final RxBool _isTrigger = false.obs;

  bool get isTrigger => _isTrigger.value;

  set setTrigger(bool value) {
    _isTrigger.value = value;
  }

  List<FoodsModel>? searchResult;

  Future<void> searchFoods(String key) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/api/foods/search/$key');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        searchResult = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}
