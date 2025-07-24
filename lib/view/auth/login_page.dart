import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/back_ground_container.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/log_in_controller.dart';
import 'package:foodie/model/login_model.dart';
import 'package:foodie/view/auth/registration_page.dart';
import 'package:foodie/view/auth/widget/email_text_field.dart';
import 'package:foodie/view/auth/widget/password_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());

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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 600),
                              () => const RegistrationPage(),
                            ),
                            child: ReusableText(
                              text: 'Register',
                              style: appstyle(
                                12,
                                Colors.blue,
                                FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CommonButton(
                      text: 'L O G I N',
                      btnHeight: 40.h,
                      btnWidth: width,
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          LoginnModel model = LoginnModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          String data = loginnModelToJson(model);
                          controller.userLogin(data);
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
