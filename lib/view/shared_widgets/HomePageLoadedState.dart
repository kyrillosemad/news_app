// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/news_details.dart';
import 'package:news_app/view/shared_widgets/carouselslider_item.dart';
import 'package:news_app/view/shared_widgets/news_container.dart';
import 'package:sizer/sizer.dart';

class HomePageLoadedState extends StatelessWidget {
  final state;
  const HomePageLoadedState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 92.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: SizedBox(
          width: 95.w,
          height: 30.h,
          child: CarouselSlider(items: [
            CarouselsItem(carousel: state.general[0]),
            CarouselsItem(carousel: state.general[1]),
            CarouselsItem(carousel: state.general[2]),
            CarouselsItem(carousel: state.general[3]),
          ], options: CarouselOptions(autoPlay: true, height: 28.h)),
        ),
      ),
      SizedBox(
        height: 1.h,
      ),
      Container(
        padding: EdgeInsets.only(left: 5.w),
        alignment: Alignment.centerLeft,
        child: Text(
          "Breaking News",
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 20.sp),
        ),
      ),
      SizedBox(
        height: 2.h,
      ),
      SingleChildScrollView(
        child: SizedBox(
            width: 95.w,
            height: 44.h,
            child: ListView.builder(
              itemCount: state.general.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(const NewsDetails(), arguments: {
                      "image": state.general[index].urlToImage,
                      "author": state.general[index].author,
                      "title": state.general[index].title,
                      "content": state.general[index].content,
                      "publishat": state.general[index].publishedAt,
                      "index": index
                    });
                  },
                  child: NewsContainer(index: index, news: state.general),
                );
              },
            )),
      ),
    ]);
  }
}
