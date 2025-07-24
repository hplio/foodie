import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/controller/category_controller.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/model/hook_model/hook_result.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

FetchHook useFetchCategoryWiseFoods() {
  final controller = Get.put(CategoryController());
  final foodCategoryList = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse(
          '$appBaseUrl/api/foods/onlyCategory/${controller.categoryValue}');
      final respnse = await http.get(url);
      if (respnse.statusCode == 200) {
        foodCategoryList.value = foodsModelFromJson(respnse.body);
      } else {
        apiError.value = apiErrorFromJson(respnse.body);
      }
    } catch (e) {
      error.value = Exception(e.toString());
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
    data: foodCategoryList.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
