import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: () => GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  ));
}
