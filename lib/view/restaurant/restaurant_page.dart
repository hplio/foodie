import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/app_style.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/model/restaurants_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/view/restaurant/direction_page.dart';
import 'package:foodie/view/restaurant/explore_page.dart';
import 'package:foodie/view/restaurant/widget/restaurant_bottom_part.dart';
import 'package:foodie/view/restaurant/widget/restaurant_menu.dart';
import 'package:foodie/view/restaurant/widget/row_text.dart';
import 'package:get/get.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {

      
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                    imageUrl: widget.restaurant!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: RestaurantBottomPart(widget: widget.restaurant),
                ),
                Positioned(
                  top: 45.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Ionicons.chevron_back_circle,
                            size: 28,
                            color: kLightWhite,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const DirectionPage(),
                            transition: Transition.cupertino,
                            duration: const Duration(milliseconds: 600),
                          ),
                          child: Icon(
                            Ionicons.location,
                            size: 28,
                            color: kLightWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: widget.restaurant!.title,
                    style: appstyle(
                      14,
                      kSecondary,
                      FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  RowText(
                    first: 'Distance To Restaurant',
                    secound: '4.5 KM',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowText(
                    first: 'Estimated Price',
                    secound: '\$2.7',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowText(
                    first: 'Estimated Time',
                    secound: '30 min',
                  ),
                  Divider(
                    thickness: .7,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                decoration: BoxDecoration(
                  color: kGrayLight.withOpacity(.1),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                height: 30.h,
                width: width,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(25.r),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      return states.contains(WidgetState.focused)
                          ? null
                          : Colors.transparent;
                    },
                  ),
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  unselectedLabelColor: kGrayLight,
                  labelStyle: appstyle(
                    12,
                    kLightWhite,
                    FontWeight.normal,
                  ),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25.h,
                        child: Center(
                          child: Text('Menu'),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25.h,
                        child: Center(
                          child: Text('Explore '),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenu(
                      restaurantId: widget.restaurant!.id,
                    ),
                    ExplorePage(
                      code: widget.restaurant!.code,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
