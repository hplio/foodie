import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/common/custom_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ReusableText(
          text: 'Please Verify Your Account',
          style: appstyle(
            12,
            kGray,
            FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            height: height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                LottieBuilder.asset('assets/anime/delivery.json'),
                SizedBox(
                  height: 10.h,
                ),
                ReusableText(
                  text: 'Verify Your Account',
                  style: appstyle(
                    20,
                    kPrimary,
                    FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Enter 6-digit code sent to your email, if you did not receive the code, please check your spam folder',
                  textAlign: TextAlign.justify,
                  style: appstyle(
                    10,
                    kGray,
                    FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimary,
                  borderWidth: 2,
                  textStyle: appstyle(17, kDark, FontWeight.w600),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonButton(
                  text: 'V E R I F Y  A C C O U N T',
                  btnHeight: 40.h,
                  btnWidth: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
