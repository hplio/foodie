import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      color: kOffWhite,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 23.r,
                  backgroundColor: kSecondary,
                  backgroundImage: NetworkImage(
                      'https://play-lh.googleusercontent.com/MG6c3_Zf4q_KWonZp3K2GvWD338KzDzTH8DY-nS4-3G3rS6X7CbbLLNBMTolGVg8ju3F=w526-h296-rw'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ReusableText(
                        text: 'Deliver to',
                        style: appstyle(13, kSecondary, FontWeight.w600),
                      ),
                      SizedBox(
                        width: width * .65,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          '16769 21st Ave N, Playmount, MN 55447',
                          style: appstyle(
                            11,
                            kGrayLight,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              getTimeOfDay(),
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return '☀️';
    } else if (hour >= 12 && hour < 17) {
      return '⛅';
    } else {
      return '🌙';
    }
  }
}
