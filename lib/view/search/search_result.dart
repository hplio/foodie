import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/search_controller.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/view/home/widget/food_tile.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 0),
      height: height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.searchResult!.length,
        itemBuilder: (_, int i) {
          FoodsModel foodList = controller.searchResult![i];
          return FoodTile(food: foodList);
        },
      ),
    );
  }
}
