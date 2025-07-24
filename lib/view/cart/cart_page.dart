import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/login_require_page.dart';
import 'package:foodie/controller/log_in_controller.dart';
import 'package:foodie/model/login_response.dart';
import 'package:foodie/view/auth/verification_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../common/custom_container.dart';
import '../../constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    final controller = Get.put(LogInController());
    final box = GetStorage();
    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRequirePage();
    }
    if (user != null && user.verification == false) {
      return const VerificationPage();
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          height: 130,
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          child: Container(),
        ),
      ),
    );
  }
}
