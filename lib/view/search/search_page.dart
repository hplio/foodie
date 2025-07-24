import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/custom_text_filed.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/search_controller.dart';
import 'package:foodie/shimmers/foodlist_shimmer.dart';
import 'package:foodie/view/search/search_result.dart';
import 'package:foodie/view/search/widget/loading_widget.dart';
import 'package:get/get.dart';

import '../../common/custom_container.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    final TextEditingController searchController = TextEditingController();
    return Obx(
      () => Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextFiled(
              controller: searchController,
              hintText: 'Search For Foods',
              suffixIcon: GestureDetector(
                onTap: () {
                  if (controller.isTrigger == false) {
                    controller.searchFoods(searchController.text);
                    controller.setTrigger = true;
                  } else {
                    controller.searchResult = null;
                    controller.setTrigger = false;
                    searchController.clear();
                  }
                },
                child: controller.isTrigger == false
                    ? Icon(
                        Ionicons.search_circle,
                        size: 40.h,
                        color: kGray,
                      )
                    : Icon(
                        Ionicons.close_circle,
                        size: 40.h,
                        color: kRed,
                      ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            color: Colors.white,
            child: controller.isLoading
                ? const FoodsListShimmer()
                : controller.searchResult == null
                    ? LoadingWidget()
                    : SearchResult(),
          ),
        ),
      ),
    );
  }
}
