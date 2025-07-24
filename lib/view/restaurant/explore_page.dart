import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_foods.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/foods/foods_page.dart';
import 'package:foodie/view/home/widget/food_tile.dart';
import 'package:get/get.dart';

class ExplorePage extends HookWidget {
  const ExplorePage({
    super.key,
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods(code);
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading
          ? const FoodsListShimmer()
          : SizedBox(
              height: height * .7,
              child: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(
                  foods!.length,
                  (int index) {
                    final FoodsModel food = foods[index];
                    return FoodTile(
                      onTap: () => Get.to(
                        () => FoodsPage(
                          food: food,
                        ),
                        transition: Transition.cupertino,
                        duration: Duration(milliseconds: 600),
                      ),
                      food: food,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
