import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controller/tab_indeex_controller.dart';
import 'package:foodie/view/cart/cart_page.dart';
import 'package:foodie/view/home/home_page.dart';
import 'package:foodie/view/profile/profile_page.dart';
import 'package:foodie/view/search/search_page.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndeexController());
    final List<Widget> pageList = [
      const HomePage(),
      const SearchPage(),
      const CartPage(),
      const ProfilePage(),
    ];
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kPrimary),
                child: BottomNavigationBar(
                    elevation: 0,
                    currentIndex: controller.tabIndex,
                    onTap: (value) => controller.setTabIndex(value),
                    selectedIconTheme: IconThemeData(color: kSecondary),
                    unselectedIconTheme: IconThemeData(color: Colors.black38),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                        icon: controller.tabIndex == 0
                            ? Icon(AntDesign.appstore1)
                            : Icon(AntDesign.appstore_o),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Badge(
                            label: Text('1'),
                            child: Icon(FontAwesome.opencart)),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: controller.tabIndex == 3
                            ? Icon(FontAwesome.user)
                            : Icon(FontAwesome.user_o),
                        label: 'Profile',
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
