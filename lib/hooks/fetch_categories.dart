import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/model/api_error.dart';
import 'package:foodie/model/categories.dart';
import 'package:foodie/model/hook_model/hook_result.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

FetchHook useFetchCategories() {
  final categoriesItem = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/category/random');
      final respnse = await http.get(url);
      if (respnse.statusCode == 200) {
        categoriesItem.value = categoriesModelFromJson(respnse.body);
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
    data: categoriesItem.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
