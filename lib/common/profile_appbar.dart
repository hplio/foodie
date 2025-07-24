import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kLightWhite,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/usa.svg',
                  height: 25.h,
                  width: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  height: 15.h,
                  width: 1.w,
                  color: kGrayLight,
                ),
                SizedBox(
                  width: 5.w,
                ),
                ReusableText(
                  text: 'USA',
                  style: appstyle(
                    16,
                    kDark,
                    FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Icon(
                      SimpleLineIcons.settings,
                      size: 16.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
