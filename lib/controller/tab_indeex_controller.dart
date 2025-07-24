import 'package:get/get.dart';

class TabIndeexController extends GetxController {
  final RxInt _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  void setTabIndex(int value) {
    _tabIndex.value = value;
  }
}
