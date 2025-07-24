import 'package:foodie/model/additives_obs.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt curruntIndex = 0.obs;
  var additiveList = <AdditiveObs>[].obs;
  bool initialIsSelected = false;

  void changePage(int index) {
    curruntIndex.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additiveList.clear();
    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        selected: false,
      );
      if (additives.length == additiveList.length) {
      } else {
        additiveList.add(additive);
      }
    }
  }

  final RxDouble _totalPrice = 0.0.obs;

  double get additivePrice => _totalPrice.value;

  set setTotalPrice(double value) {
    _totalPrice.value = value;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var additivePrice in additiveList) {
      if (additivePrice.isSelected.value) {
        totalPrice += double.tryParse(additivePrice.price) ?? 0.0;
      }
    }
    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
