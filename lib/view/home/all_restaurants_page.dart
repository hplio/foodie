import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/back_ground_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_all_restaurants.dart';
import 'package:foodie/model/restaurants_model.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/home/widget/restaurant_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/view/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class AllRestaurantsPage extends HookWidget {
  const AllRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookRestult = useFetchAllRestaurants('506384');
    List<RestaurantsModel>? restaurantList = hookRestult.data;
    final isLoading = hookRestult.isLoading;
    final error = hookRestult.error;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: 'Nearby Restaurants',
          style: appstyle(
            13,
            kLightWhite,
            FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(
                    restaurantList!.length,
                    (i) {
                      RestaurantsModel restaurant = restaurantList[i];
                      return RestaurantTile(
                        onTap: () => Get.to(
                          () => RestaurantPage(restaurant: restaurant),
                          transition: Transition.cupertino,
                          duration: Duration(milliseconds: 600),
                        ),
                        restaurant: restaurant,
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
