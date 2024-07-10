import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/resources/change_mode.dart';
import 'package:news_app/view/screens/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CHANGE controller) {
      return SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) async {
          setState(() => _currentIndex = i);
          if (_currentIndex == 0) {
            Get.offAll(const HomePage());
          }
          if (_currentIndex == 1) {
            controller.changeMode();
          }
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home,
              size: 15.sp,
            ),
            title: const Text(
              "Home",
            ),
            selectedColor: Colors.purple,
          ),
          // mode
          SalomonBottomBarItem(
            icon: controller.isDark == true
                ? Icon(
                    Icons.light_mode,
                    size: 15.sp,
                  )
                : Icon(
                    Icons.dark_mode_rounded,
                    size: 15.sp,
                  ),
            title: controller.isDark == true
                ? const Text("Light mode")
                : const Text("Dark mode"),
            selectedColor: Colors.orange,
          ),

          /// Profile
        ],
      );
    });
  }
}
