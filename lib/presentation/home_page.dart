import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/news_model.dart';
import 'package:news_app/presentation/favorite.dart';
import 'package:news_app/presentation/general_news.dart';
import 'package:news_app/presentation/health_news.dart';
import 'package:news_app/presentation/news_details.dart';
import 'package:news_app/presentation/resources/change_mode.dart';
import 'package:news_app/presentation/science_news.dart';
import 'package:news_app/presentation/slider_items_home_page.dart';
import 'package:news_app/presentation/sports_news.dart';
import 'package:news_app/presentation/tech_news.dart';
import 'package:sizer/sizer.dart';
import 'package:news_app/data/general_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    super.initState();
    get_general_data();
  }

  var _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////app bar///////////////////////////////////////////////////////
        appBar: AppBar(
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      child: Text("general news"),
                      value: "general",
                    ),
                    PopupMenuItem(child: Text("health news"), value: "health"),
                    PopupMenuItem(
                        child: Text("science news"), value: "science"),
                    PopupMenuItem(child: Text("sports news"), value: "sports"),
                    PopupMenuItem(
                        child: Text("technology news"), value: "technology"),
                  ];
                },
                icon: Icon(
                  Icons.menu,
                  size: 27.sp,
                  color: Colors.black,
                ),
                onSelected: (value) {
                  if (value == "general") {
                    Get.to(GENERAL_NEWS());
                  }
                  if (value == "health") {
                    Get.to(HEALTH_NEWS());
                  }
                  if (value == "science") {
                    Get.to(SCIENCE_NEWS());
                  }
                  if (value == "sports") {
                    Get.to(SPORTS_NEWS());
                  }
                  if (value == "technology") {
                    Get.to(TECH_NEWS());
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
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////bottomnavigationbar///////////////////////////////////////////////////////

        bottomNavigationBar: GetBuilder(builder: (CHANGE controller) {
          return SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) async {
              setState(() => _currentIndex = i);
              if (_currentIndex == 0) {
                Get.offAll(home_page());
              }
              if (_currentIndex == 1) {
                await Future.delayed(Duration(milliseconds: 400));
                Get.to(FAVORITE());
              }
              if (_currentIndex == 2) {
                controller.change_mode();
              }
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.save_outlined),
                title: Text("saved"),
                selectedColor: Colors.pink,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: controller.is_dark == true
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode_rounded),
                title: controller.is_dark == true
                    ? Text("Light mode")
                    : Text("Dark mode"),
                selectedColor: Colors.orange,
              ),

              /// Profile
            ],
          );
        }),

        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////body///////////////////////////////////////////////////////
        body: Container(
          width: 100.w,
          height: 100.h,
          child: FutureBuilder(
            future: get_general_data(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(children: [
                Container(
                  width: 92.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: loading == true
                      ? Container(
                          width: 92.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          width: 95.w,
                          height: 30.h,
                          child: CarouselSlider(
                              items: const [
                                slider_items(0),
                                slider_items(1),
                                slider_items(2),
                                slider_items(3),
                                slider_items(4),
                              ],
                              options: CarouselOptions(
                                  autoPlay: true, height: 28.h)),
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
                  child: Container(
                      width: 95.w,
                      height: 45.h,
                      child: snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(NEWS_DETAILS(), arguments: {
                                      "image": Articles.fromJson(
                                              snapshot.data[index])
                                          .urlToImage,
                                      "author": Articles.fromJson(
                                              snapshot.data[index])
                                          .author,
                                      "title": Articles.fromJson(
                                              snapshot.data[index])
                                          .title,
                                      "content": Articles.fromJson(
                                              snapshot.data[index])
                                          .content,
                                      "publishat": Articles.fromJson(
                                              snapshot.data[index])
                                          .publishedAt,
                                      "index": index
                                    });
                                  },
                                  child: Container(
                                    width: 95.w,
                                    height: 19.h,
                                    padding: EdgeInsets.all(5.sp),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    margin: EdgeInsets.only(bottom: 1.5.h),
                                    child: Row(children: [
                                      Hero(
                                        tag: "${index}",
                                        child: Container(
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${Articles.fromJson(snapshot.data[index]).urlToImage}",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${Articles.fromJson(snapshot.data[index]).author}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "${Articles.fromJson(snapshot.data[index]).title}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "${Articles.fromJson(snapshot.data[index]).publishedAt}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                );
                              },
                            )),
                ),
              ]);
            },
          ),
        ));
  }
}
