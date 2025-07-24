import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/hooks/fetch_near_by_restaurants.dart';
import 'package:foodie/model/restaurants_model.dart';
import 'package:foodie/shimmers/nearby_shimmer.dart';
import 'package:foodie/view/home/widget/restaurant_widget.dart';
import 'package:foodie/view/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class NearbyRestaurantsList extends HookWidget {
  const NearbyRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookRestult = useFetchNearByRestaurants('506384');
    List<RestaurantsModel>? restaurantList = hookRestult.data;
    final isLoading = hookRestult.isLoading;
    final error = hookRestult.error;
    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 200.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                restaurantList!.length,
                (i) {
                  var restaurant = restaurantList[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RestaurantWidget(
                      onTap: () => Get.to(
                        () => RestaurantPage(restaurant: restaurant),
                        transition: Transition.cupertino,
                        duration: Duration(milliseconds: 600),
                      ),
                      image: restaurant.imageUrl,
                      logo: restaurant.logoUrl,
                      title: restaurant.title,
                      rating: restaurant.ratingCount,
                      time: restaurant.time,
                      starRating: restaurant.rating,
                    ),
                  );
                },
              ),
            ),
          );
  }
}
