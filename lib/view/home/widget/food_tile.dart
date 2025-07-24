import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/model/foods_model.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, this.onTap, required this.food, this.color});

  final void Function()? onTap;
  final FoodsModel food;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: color ?? kOffWhite,
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: Image.network(
                            food.imageUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                            color: kGray.withOpacity(.6),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              itemCount: 5,
                              rating: 5,
                              itemBuilder: (_, int index) => Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemSize: 13.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: food.title,
                        style: appstyle(11, kDark, FontWeight.w400),
                      ),
                      ReusableText(
                        text: "Delivery time: ${food.time}",
                        style: appstyle(11, kGray, FontWeight.w400),
                      ),
                      SizedBox(
                        width: width * .7,
                        height: 18.h,
                        child: ListView.builder(
                          itemCount: food.additives.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int i) {
                            var additives = food.additives[i];

                            return Container(
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(9.r),
                                ),
                                color: kSecondaryLight,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: ReusableText(
                                    text: additives.title,
                                    style: appstyle(8, kGray, FontWeight.w400),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 6.h,
            right: 5.w,
            child: Container(
              height: 19.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: kPrimary,
              ),
              child: Center(
                child: ReusableText(
                  text: ' \$ ${food.price}',
                  style: appstyle(
                    12,
                    kLightWhite,
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 6.h,
            right: 75.w,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 19.h,
                width: 19.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: kSecondary,
                ),
                child: Center(
                  child: Icon(
                    MaterialCommunityIcons.cart_plus,
                    size: 15.h,
                    color: kOffWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
