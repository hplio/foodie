import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/hook_model/hook_result.dart';
import 'package:foodie/model/restaurants_model.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

FetchHook useFetchNearByRestaurants(String code) {
  final restaurants = useState<List<RestaurantsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
 
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/$code');
      final respnse = await http.get(url);
      if (respnse.statusCode == 200) {
        restaurants.value = restaurantsModelFromJson(respnse.body);
      } else {
        apiError.value = apiErrorFromJson(respnse.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
