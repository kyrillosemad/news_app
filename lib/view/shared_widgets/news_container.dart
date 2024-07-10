// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsContainer extends StatelessWidget {
  final news;
  final int index;
  const NewsContainer({
    super.key,
    required this.index,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.w,
      height: 22.h,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Theme.of(context).primaryColor,
      ),
      margin: EdgeInsets.only(bottom: 1.5.h),
      child: Row(children: [
        Hero(
          tag: "$index",
          child: Container(
            width: 35.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                image: DecorationImage(
                    image: NetworkImage(
                      "${news[index].urlToImage}",
                    ),
                    fit: BoxFit.fill)),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
          width: 54.w,
          padding: EdgeInsets.all(5.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${news[index].author}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "${news[index].title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("${news[index].publishedAt}"),
            ],
          ),
        )
      ]),
    );
  }
}
