import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.only(bottom: 180.h),
        child: LottieBuilder.asset(
          'assets/anime/delivery.json',
          height: height / 2,
          width: width,
        ),
      ),
    );
  }
}
