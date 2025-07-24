import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/constants/constants.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.onEditingComplete,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.hintText,
    this.maxLines=1,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.w),
      decoration: BoxDecoration(
        border: Border.all(color: kGray, width: 0.4),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        cursorHeight: 20.h,
        style: appstyle(
          14.sp,
          kGray,
          FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: appstyle(
            14.sp,
            kGray,
            FontWeight.normal,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
