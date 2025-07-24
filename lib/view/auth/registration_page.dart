import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/back_ground_container.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/registration_controller.dart';
import 'package:foodie/model/registration_model.dart';
import 'package:foodie/view/auth/widget/email_text_field.dart';
import 'package:foodie/view/auth/widget/password_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final controller =Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        title: ReusableText(
          text: 'Foodie',
          style: appstyle(20, kLightWhite, FontWeight.bold),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Lottie.asset('assets/anime/delivery.json'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(
                      prefixIcon: const Icon(
                        AntDesign.user,
                        size: 22,
                        color: kGrayLight,
                      ),
                      hintText: 'Username',
                      controller: _usernameController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    EmailTextField(
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: kGrayLight,
                      ),
                      hintText: 'Enter Email',
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CommonButton(
                      text: 'R E G I S T E R',
                      btnHeight: 40.h,
                      btnWidth: width,
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _usernameController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          RegistrationModel model = RegistrationModel(
                            userName: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          String data = registrationModelToJson(model);
                          controller.userRegistration(data);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
