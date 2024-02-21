import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:sizer/sizer.dart';

class FAVORITE extends StatefulWidget {
  const FAVORITE({super.key});

  @override
  State<FAVORITE> createState() => _FAVORITEState();
}

class _FAVORITEState extends State<FAVORITE> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            width: 100.w,
            color: Colors.grey,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Get.offAll(home_page());
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.sp,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.sp, right: 15.sp),
                    child: Text(
                      "saved news",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            width: 100.w,
            height: 90.h,
            child: Center(
              child: Text(
                "loading...",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
