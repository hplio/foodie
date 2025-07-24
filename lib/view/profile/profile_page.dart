import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/common/login_require_page.dart';
import 'package:foodie/common/profile_appbar.dart';
import 'package:foodie/controller/log_in_controller.dart';
import 'package:foodie/model/login_response.dart';
import 'package:foodie/view/auth/verification_page.dart';
import 'package:foodie/view/profile/widget/profile_tile_widget.dart';
import 'package:foodie/view/profile/widget/user_info_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../common/custom_container.dart';
import '../../constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    final controller = Get.put(LogInController());
    final box = GetStorage();
    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
      debugPrint(user?.email);
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
        preferredSize: Size.fromHeight(40.h),
        child: ProfileAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          child: Column(
            children: [
              UserInfoWidget(
                user: user,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 193.h,
                decoration: const BoxDecoration(
                  color: kLightWhite,
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    ProfileTileWidget(
                      onTap: () => Get.to(
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        () => const LoginRequirePage(),
                      ),
                      title: 'My Oders',
                      icon: Ionicons.fast_food_outline,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'My Favourites',
                      icon: Ionicons.heart_outline,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'Reviews',
                      icon: Ionicons.chatbox_outline,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'Coupons',
                      icon: MaterialCommunityIcons.tag_outline,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 193.h,
                decoration: const BoxDecoration(
                  color: kLightWhite,
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'Shipping Address',
                      icon: SimpleLineIcons.location_pin,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'Service Center',
                      icon: AntDesign.customerservice,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'Reviews',
                      icon: MaterialIcons.rss_feed,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: 'Settings',
                      icon: AntDesign.setting,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonButton(
                btnColor: kRed,
                radius: 0.r,
                text: 'Logout',
                onTap: () => controller.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
