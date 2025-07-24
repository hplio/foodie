import 'package:flutter/material.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/category_controller.dart';
import 'package:foodie/model/categories.dart';
import 'package:foodie/view/category/category_page.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(
          () => CategoryPage(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 600),
        );
      },
      leading: CircleAvatar(
        backgroundColor: kGrayLight,
        radius: 18.r,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
        text: category.title,
        style: appstyle(
          12,
          kGray,
          FontWeight.normal,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}
