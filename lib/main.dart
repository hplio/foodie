import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/view/entrypoint.dart';
import 'package:get/get.dart';

Widget defultHome =const MainScreen();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foodie',
          theme: ThemeData(
            scaffoldBackgroundColor: kOffWhite,
            iconTheme: IconThemeData(color: kDark),
            primarySwatch: Colors.grey,
          ),
          home: defultHome,
        );
      },
    );
  }
}
