import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/home_page.dart';
import 'package:sizer/sizer.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 100.w,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                Get.offAll(const HomePage());
              },
              child: Icon(
                Icons.arrow_back,
                size: 25.sp,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6.sp, right: 15.sp),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ]),
    );
  }
}
