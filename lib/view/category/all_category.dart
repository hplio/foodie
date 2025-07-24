import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/back_ground_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/hooks/fetch_all_categories.dart';
import 'package:foodie/model/categories.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/category/widget/category_widget.dart';

class AllCategory extends HookWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final resultHook = useFetchAllCategories();
    List<CategoriesModel>? categoriesList = resultHook.data;
    final isLoading = resultHook.isLoading;
    final error = resultHook.error;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'Category',
          style: appstyle(
            12,
            kGray,
            FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          height: height,
          padding: EdgeInsets.only(top: 10.h, left: 12.w),
          child: isLoading
              ?const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    categoriesList!.length,
                    (i) {
                      CategoriesModel category = categoriesList[i];
                      return Category(category: category);
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
