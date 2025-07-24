import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_category_food.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/home/widget/food_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFoodList extends HookWidget {
  const CategoryFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookRestult = useFetchCategoryWiseFoods();
    List<FoodsModel>? foodList = hookRestult.data;
    final isLoading = hookRestult.isLoading;
    final error = hookRestult.error;
      return SizedBox(
        height: height,
        width: width,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(
                    foodList!.length,
                    (i) {
                      FoodsModel food = foodList[i];
                      return FoodTile(
                        color: Colors.white,
                        food: food,
                      );
                    },
                  ),
                ),
              ),
      );
  }
}
