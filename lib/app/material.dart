import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/intro_page.dart';
import 'package:news_app/presentation/resources/change_mode.dart';
import 'package:news_app/presentation/resources/dark_mode.dart';
import 'package:news_app/presentation/resources/light_mode.dart';
import 'package:sizer/sizer.dart';

class news extends StatefulWidget {
  const news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  var conrtoller = Get.put(CHANGE());
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return GetBuilder(builder: (CHANGE controller) {
        return GetMaterialApp(
          theme: controller.is_dark == true ? DARK.dark : LIGHT.light,
          home: intro_page(),
          debugShowCheckedModeBanner: false,
        );
      });
    });
  }
}
