import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.first,
    required this.secound,
  });

  final String first;
  final String secound;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: first,
          style: appstyle(
            10,
            kGray,
            FontWeight.w500,
          ),
        ),
        ReusableText(
          text: secound,
          style: appstyle(
            10,
            kGray,
            FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
