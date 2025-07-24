import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/custom_appbar.dart';
import 'package:foodie/common/custom_container.dart';
import 'package:foodie/common/heading.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/category_controller.dart';
import 'package:foodie/view/home/all_fast_food_page.dart';
import 'package:foodie/view/home/all_restaurants_page.dart';
import 'package:foodie/view/home/recommandation_page.dart';
import 'package:foodie/view/home/widget/category_food_list.dart';
import 'package:foodie/view/home/widget/category_list.dart';
import 'package:foodie/view/home/widget/food_list.dart';
import 'package:get/get.dart';
import 'widget/nearby_restaurants_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: CustomAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          child: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ''
                    ? Column(
                        children: [
                          Heading(
                            title: 'Try Something New',
                            onTap: () => Get.to(
                              () => const RecommandationPage(),
                              transition: Transition.cupertino,
                              duration: Duration(milliseconds: 600),
                            ),
                          ),
                          const FoodList(),
                          Heading(
                            title: 'Nearby Restaurants',
                            onTap: () => Get.to(
                              () => const AllRestaurantsPage(),
                              transition: Transition.cupertino,
                              duration: Duration(milliseconds: 600),
                            ),
                          ),
                          const NearbyRestaurantsList(),
                          Heading(
                            title: 'Food Closer To You',
                            onTap: () => Get.to(
                              () => const AllFastFoodPage(),
                              transition: Transition.cupertino,
                              duration: Duration(milliseconds: 600),
                            ),
                          ),
                          const FoodList(),
                        ],
                      )
                    : CustomContainer(
                        child: Column(
                          children: [
                            Heading(
                              showMore: false,
                              title: 'Explore ${controller.titleValue} Category',
                            ),
                           const CategoryFoodList(),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2