import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/hooks/fetch_foods.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/shimmers/nearby_shimmer.dart';
import 'package:foodie/view/foods/foods_page.dart';
import 'package:foodie/view/home/widget/food_widget.dart';
import 'package:get/get.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookRestult = useFetchFoods('56789012');
    List<FoodsModel>? foodList = hookRestult.data;
    final isLoading = hookRestult.isLoading;
    final error = hookRestult.error;
    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 186.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                foodList!.length,
                (i) {
                  FoodsModel food = foodList[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FoodWidget(
                       onTap: () => Get.to(
                          () => FoodsPage(food: food),
                        ),
                      image: food.imageUrl[0],
                      title: food.title,
                      time: food.time,
                      price: food.price.toString(),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
