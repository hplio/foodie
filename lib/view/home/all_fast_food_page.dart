import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/back_ground_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/hooks/fetch_all_food.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/home/widget/food_tile.dart';

class AllFastFoodPage extends HookWidget {
  const AllFastFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods('56789012');
    List<FoodsModel>? foodList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: 'All Fast Food',
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
                    foodList!.length,
                    (i) {
                      FoodsModel food = foodList[i];
                      return FoodTile(
                        food: food,
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
