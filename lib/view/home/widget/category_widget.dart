import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/category_controller.dart';
import 'package:foodie/model/categories.dart';
import 'package:foodie/view/category/all_category.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.value == 'more') {
          Get.to(
            () => AllCategory(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 600),
          );
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * .19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: controller.categoryValue == category.id
                  ? kSecondary
                  : kOffWhite,
              width: .5.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              ReusableText(
                text: category.title,
                style: appstyle(
                  12,
                  kDark,
                  FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
