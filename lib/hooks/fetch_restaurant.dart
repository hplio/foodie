import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/hook_model/hook_restaurant.dart';
import 'package:foodie/model/restaurants_model.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

FetchRestaurant useFetchRestaurantsDetail(String id) {
  final restaurants = useState<RestaurantsModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/byId/$id');
      final respnse = await http.get(url);
      if (respnse.statusCode == 200) {
        var data = jsonDecode(respnse.body);
        restaurants.value = RestaurantsModel.fromJson(data);
      } else {
        apiError.value = apiErrorFromJson(respnse.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    Future.delayed(Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchRestaurant(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
