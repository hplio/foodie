import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/common/custom_text_filed.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/food_controller.dart';
import 'package:foodie/hooks/fetch_restaurant.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/view/auth/phone_verificarion_page.dart';
import 'package:foodie/view/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class FoodsPage extends HookWidget {
  const FoodsPage({super.key, required this.food});

  final FoodsModel food;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantsDetail(food.restaurant);
    final TextEditingController prefController = TextEditingController();
    final controller = Get.put(FoodController());
    controller.loadAdditives(food.additives);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.r),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    onPageChanged: (value) => controller.changePage(value),
                    itemCount: food.imageUrl.length,
                    itemBuilder: (_, int i) {
                      var imageUrl = food.imageUrl[i];
                      return SizedBox(
                        width: width,
                        height: 230.h,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imageUrl,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        food.imageUrl.length,
                        (int i) => Obx(
                          () => Container(
                            margin: EdgeInsets.all(4.h),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.curruntIndex.value == i
                                  ? kSecondary
                                  : kGray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Ionicons.chevron_back_circle,
                      size: 30,
                      color: kPrimary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 12,
                  child: CommonButton(
                    onTap: () {
                      Get.to(
                        () => RestaurantPage(
                          restaurant: hookResult.data,
                        ),
                      );
                    },
                    text: 'Open Restaurant',
                    btnWidth: 120.w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: food.title,
                      style: appstyle(
                        18,
                        kDark,
                        FontWeight.w600,
                      ),
                    ),
                    Obx(
                      () => ReusableText(
                        text:
                            '\$ ${((food.price + controller.additivePrice) * controller.count.value).toStringAsFixed(2)}',
                        style: appstyle(
                          18,
                          kPrimary,
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  food.discription,
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                  style: appstyle(
                    12,
                    kGray,
                    FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 18.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      food.foodTags.length,
                      (int index) {
                        var foodTag = food.foodTags[index];
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Text(
                              foodTag,
                              style: appstyle(
                                12,
                                kWhite,
                                FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ReusableText(
                  text: 'Additives and Toppings',
                  style: appstyle(
                    18,
                    kDark,
                    FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => Column(
                    children: List.generate(
                      controller.additiveList.length,
                      (int i) {
                        var additive = controller.additiveList[i];
                        return CheckboxListTile(
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          activeColor: kSecondary,
                          contentPadding: EdgeInsets.zero,
                          value: additive.isSelected.value,
                          tristate: false,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                text: additive.title,
                                style: appstyle(
                                  12,
                                  kDark,
                                  FontWeight.w400,
                                ),
                              ),
                              ReusableText(
                                text: '\$ ${additive.price}',
                                style: appstyle(
                                  12,
                                  kPrimary,
                                  FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          onChanged: (bool? value) {
                            additive.toggleChecked();
                            controller.getTotalPrice();
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Qauntity',
                      style: appstyle(
                        18,
                        kDark,
                        FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => controller.increment(),
                          child: Icon(AntDesign.pluscircleo),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Obx(
                            () => ReusableText(
                              text: controller.count.value.toString(),
                              style: appstyle(
                                14,
                                kDark,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.decrement(),
                          child: Icon(AntDesign.minuscircleo),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ReusableText(
                  text: 'Preference',
                  style: appstyle(
                    18,
                    kDark,
                    FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 65.h,
                  child: CustomTextFiled(
                    controller: prefController,
                    maxLines: 3,
                    hintText: 'Add note with your preferences',
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => showVerification(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: ReusableText(
                            text: 'Place Order',
                            style: appstyle(
                              18,
                              kLightWhite,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: kSecondary,
                        child: Icon(
                          Ionicons.cart,
                          color: kLightWhite,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerification(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 470.h,
          width: width,
          decoration: BoxDecoration(
            color: kLightWhite,
            image: const DecorationImage(
              image: AssetImage('assets/images/restaurant_bk.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Verify your phonenumber',
                  textAlign: TextAlign.justify,
                  style: appstyle(
                    18,
                    kPrimary,
                    FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 280.h,
                  child: Column(
                    children: List.generate(
                      verificationResons.length,
                      (int index) => ListTile(
                        leading: const Icon(
                          Icons.check_circle,
                          color: kPrimary,
                        ),
                        title: Text(
                          verificationResons[index],
                          style: appstyle(
                            11,
                            kGray,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CommonButton(
                  btnHeight: 35.h,
                  text: 'Verify Phone Number',
                  onTap: () => Get.to(() => const PhoneVerificarionPage()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
