import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:sizer/sizer.dart';

class intro_page extends StatefulWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "KEA",
                  style: TextStyle(fontSize: 30.sp, color: Colors.cyanAccent),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "News",
                  style: TextStyle(
                    fontSize: 30.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              width: 99.w,
              height: 45.h,
              child: Lottie.network(
                  "https://lottie.host/6bfe1eb2-7ba7-4786-9353-7ceab04c1769/uQkk0SxPmA.json"),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "News from around the world",
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              "For you",
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            MaterialButton(
              onPressed: () {
                Get.offAll(() => home_page());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(20.sp)),
                width: 45.w,
                height: 7.h,
                child: Center(
                  child: Text(
                    "Get started",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
