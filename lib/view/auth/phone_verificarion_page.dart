import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/constants/constants.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificarionPage extends StatelessWidget {
  const PhoneVerificarionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appstyle(
        20,
        kPrimary,
        FontWeight.bold,
      ),
      textColor: kDark,
      onSend: (String value) {
        debugPrint('Phone number: $value');
      },
      onVerification: (String value) {
        debugPrint('OTP: $value');
      },
    );
  }
}
