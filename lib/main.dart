// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/view%20model/cubit/news_cubit.dart';
import 'package:news_app/view/resources/change_mode.dart';
import 'package:news_app/view/resources/dark_mode.dart';
import 'package:news_app/view/resources/light_mode.dart';
import 'package:news_app/view/screens/intro_page.dart';
import 'package:sizer/sizer.dart';

void main() async {
  runApp(const News());
}

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var changeController = Get.put(CHANGE());
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return BlocProvider(
        create: (context) => NewsCubit(),
        child: GetBuilder(builder: (CHANGE controller) {
          return GetMaterialApp(
            theme: controller.isDark == true ? DARK.dark : LIGHT.light,
            home: const IntroPage(),
            debugShowCheckedModeBanner: false,
          );
        }),
      );
    });
  }
}
