import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/model/restaurants_model.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    super.key,
    this.onTap,
    required this.restaurant,
  });

  final void Function()? onTap;
  final RestaurantsModel restaurant;

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
              color: kOffWhite,
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
                            restaurant.imageUrl,
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
                        text: restaurant.title,
                        style: appstyle(11, kDark, FontWeight.w400),
                      ),
                      ReusableText(
                        text: "Delivery time: ${restaurant.time}",
                        style: appstyle(11, kGray, FontWeight.w400),
                      ),
                      SizedBox(
                        width: width * .7,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          restaurant.coords.address,
                          style: appstyle(9, kGray, FontWeight.w400),
                        ),
                      ),
                    ],
                  )
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
                color: restaurant.isAvailable == true ||
                        restaurant.isAvailable == null
                    ? kPrimary
                    : kGrayLight,
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant.isAvailable == true ||
                          restaurant.isAvailable == null
                      ? 'Open'
                      : 'Close',
                  style: appstyle(
                    12,
                    kLightWhite,
                    FontWeight.w600,
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
