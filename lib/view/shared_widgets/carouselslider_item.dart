// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarouselsItem extends StatelessWidget {
  final carousel;
  const CarouselsItem({super.key, required this.carousel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      margin: EdgeInsets.all(5.sp),
      width: 92.w,
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(
              image: NetworkImage("${carousel.urlToImage}"), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: Colors.grey.withOpacity(0.7),
            ),
            margin: EdgeInsets.only(bottom: 8.sp),
            padding: EdgeInsets.all(10.sp),
            alignment: Alignment.center,
            width: 100.w,
            height: 12.h,
            child: Text(
              "${carousel.title}",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
