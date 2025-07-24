import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/back_ground_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/category_controller.dart';
import 'package:foodie/hooks/fetch_category_food.dart';
import 'package:foodie/model/foods_model.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/home/widget/food_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookRestult = useFetchCategoryWiseFoods();
    List<FoodsModel>? foodList = hookRestult.data;
    final isLoading = hookRestult.isLoading;
    final error = hookRestult.error;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            controller.updateCategory='';
            controller.updateTitle='';
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: kDark,
          ),
        ),
        title: ReusableText(
          text: "${controller.titleValue} Category",
          style: appstyle(
            14,
            kGray,
            FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          height: height,
          // padding: EdgeInsets.only(top: 10.h, left: 12.w),
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    children: List.generate(
                      foodList?.length ?? 0,
                      (i) {
                        FoodsModel food = foodList![i];
                        return FoodTile(
                          food: food,
                        );
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
