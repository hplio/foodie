import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  final void Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      leading: Icon(
        icon,
        size: 18,
      ),
      title: ReusableText(
        text: title,
        style: appstyle(
          11 ,
          kGray,
          FontWeight.normal,
        ),
      ),
      trailing: title != 'Settings'
          ? Icon(
              AntDesign.right,
              color: kGray,
              size: 16,
            )
          : SvgPicture.asset(
              'assets/icons/usa.svg',
              width: 15.w,
              height: 20.h,
            ),
      onTap: onTap,
    );
  }
}
