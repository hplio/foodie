import 'package:get/get.dart';

class AdditiveObs extends GetxController {
  final int id;
  final String title;
  final String price;
  RxBool isSelected = false.obs;

  AdditiveObs({
    required this.id,
    required this.title,
    required this.price,
    bool selected = false,
  }) {
    isSelected.value = selected;
  }

  void toggleChecked() {
    isSelected.value = !isSelected.value;
  }
}
