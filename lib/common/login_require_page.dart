import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/common/custom_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/view/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginRequirePage extends StatelessWidget {
  const LoginRequirePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ReusableText(
          text: 'Please Login to access this page',
          style: appstyle(
            12,
            kGray,
            FontWeight.bold,
          ),
        ),
      ),
      body: CustomContainer(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset(
                'assets/anime/delivery.json',
                height: height / 2,
                width: width,
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonButton(
                text: 'L O G I N',
                btnHeight: 40.h,
                btnWidth: width-20,
                onTap: () => Get.to(
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600),
                  () => const LoginPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
