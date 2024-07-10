import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
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
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Hero(
              tag: '$index',
              child: Container(
                padding: EdgeInsets.only(top: 15.sp, left: 5.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp)),
                    image: DecorationImage(
                        image: NetworkImage("$image"), fit: BoxFit.fill)),
                width: 100.w,
                height: 40.h,
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
                    ]),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.sp),
                width: 100.w,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$author",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "$title",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "$content",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "$publishat",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
