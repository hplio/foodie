import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/model/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    this.user,
  });

  final LoginResponseModel? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .06,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 23.r,
                      backgroundColor: kSecondary,
                      backgroundImage: NetworkImage(user!.profile),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ReusableText(
                            text: user?.userName ?? 'Username',
                            style: appstyle(
                              13,
                              kGray,
                              FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: width * .65,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              user?.email ?? 'email@gmail.com',
                              style: appstyle(
                                11,
                                kGray,
                                FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    FontAwesome.edit,
                    size: 20.h,
                    color: kGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
