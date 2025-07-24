import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.rating,
    this.onTap,
    required this.time,
     this.starRating,
  });

  final String image;
  final String logo;
  final String title;
  final String rating;
  final void Function()? onTap;
  final String time;
  final double? starRating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          height: 192.h,
          width: width * .75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kLightWhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 112.h,
                        width: width * .8,
                        child: Image.network(
                          image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Container(
                          padding: EdgeInsets.all(1.w),
                          color: kLightWhite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.network(
                              logo,
                              fit: BoxFit.cover,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: title,
                      style: appstyle(
                        12,
                        kDark,
                        FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: 'Delivery time',
                          style: appstyle(
                            9,
                            kDark,
                            FontWeight.w500,
                          ),
                        ),
                        ReusableText(
                          text: time,
                          style: appstyle(
                            9,
                            kDark,
                            FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: starRating?? 2.3,
                          itemBuilder: (_, int index) => Icon(
                            Icons.star,
                            color: kPrimary,
                          ),
                          itemCount: 5,
                          itemSize: 15.h,
                        ),
                        ReusableText(
                          text: "+ $rating reviews and ratings.",
                          style: appstyle(
                            9,
                            kDark,
                            FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
