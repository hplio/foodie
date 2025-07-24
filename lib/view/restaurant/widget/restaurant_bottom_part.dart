import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/common/common_button.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/model/restaurants_model.dart';
import 'package:foodie/view/restaurant/rating_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantBottomPart extends StatelessWidget {
  const RestaurantBottomPart({
    super.key,
    required this.widget,
  });

  final RestaurantsModel? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(.4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            itemSize: 25,
            itemBuilder: (context, int index) =>const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            itemCount: 5,
            rating: widget!.rating,
          ),
          CommonButton(
            btnWidth: width / 3,
            btnColor: kSecondary,
            text: 'Rate Restaurant',
            onTap: () => Get.to(
              () => const RatingPage(),
              transition: Transition.cupertino,
              duration: const Duration(milliseconds: 600),
            ),
          ),
        ],
      ),
    );
  }
}
