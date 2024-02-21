import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NEWS_DETAILS extends StatefulWidget {
  const NEWS_DETAILS({super.key});

  @override
  State<NEWS_DETAILS> createState() => _NEWS_DETAILSState();
}

class _NEWS_DETAILSState extends State<NEWS_DETAILS> {
  var image = Get.arguments["image"];
  var content = Get.arguments["content"];
  var title = Get.arguments["title"];
  var author = Get.arguments["author"];
  var publishat = Get.arguments["publishat"];
  var index = Get.arguments['index'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Hero(
            tag: '${index}',
            child: Container(
              padding: EdgeInsets.only(top: 15.sp, left: 5.sp),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        
                      },
                      child: Icon(
                        Icons.save_rounded,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                    )
                  ]),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.sp),
                      bottomRight: Radius.circular(20.sp)),
                  image: DecorationImage(
                      image: NetworkImage("${image}"), fit: BoxFit.fill)),
              width: 100.w,
              height: 40.h,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            width: 100.w,
            height: 56.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${author}",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${title}",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "${content}",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "${publishat}",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
