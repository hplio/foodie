import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.onTap,
    this.btnWidth,
    this.btnHeight,
    this.btnColor,
    this.radius,
    required this.text,
  });

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? radius;
  final Color? btnColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 28.h,
        decoration: BoxDecoration(
          color: btnColor ?? kPrimary,
          borderRadius: BorderRadius.circular(radius ?? 9.r),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(
              12,
              kLightWhite,
              FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
