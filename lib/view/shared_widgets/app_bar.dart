import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/general_news.dart';
import 'package:news_app/view/screens/health_news.dart';
import 'package:news_app/view/screens/science_news.dart';
import 'package:news_app/view/screens/sports_news.dart';
import 'package:news_app/view/screens/tech_news.dart';
import 'package:sizer/sizer.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 8.h,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                padding: EdgeInsets.only(bottom: 5.sp, left: 5.sp),
                value: "general",
                child: Text(
                  "general news",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
              PopupMenuItem(
                  padding: EdgeInsets.only(bottom: 5.sp, left: 5.sp),
                  value: "health",
                  child: Text(
                    "health news",
                    style: TextStyle(fontSize: 13.sp),
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.only(bottom: 5.sp, left: 5.sp),
                  value: "science",
                  child: Text(
                    "science news",
                    style: TextStyle(fontSize: 13.sp),
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.only(bottom: 5.sp, left: 5.sp),
                  value: "sports",
                  child: Text(
                    "sports news",
                    style: TextStyle(fontSize: 13.sp),
                  )),
              PopupMenuItem(
                  padding: EdgeInsets.only(bottom: 5.sp, left: 3.sp),
                  value: "technology",
                  child: Text(
                    "technology news",
                    style: TextStyle(fontSize: 13.sp),
                  )),
            ];
          },
          icon: Icon(
            Icons.menu,
            size: 20.sp,
            color: Colors.black,
          ),
          onSelected: (value) {
            if (value == "general") {
              Get.to(const GeneralNews());
            }
            if (value == "health") {
              Get.to(const HealthNews());
            }
            if (value == "science") {
              Get.to(const ScienceNews());
            }
            if (value == "sports") {
              Get.to(const SportsNews());
            }
            if (value == "technology") {
              Get.to(const TechNews());
            }
          },
          padding: EdgeInsets.all(10.sp),
        )
      ],
      title: Row(
        children: [
          Text(
            "KEA",
            style: TextStyle(color: Colors.cyan, fontSize: 18.sp),
          ),
          Text(
            " News",
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          )
        ],
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}
