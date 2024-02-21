import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/data/science_data.dart';
import 'package:news_app/modules/news_model.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:news_app/presentation/news_details.dart';
import 'package:sizer/sizer.dart';

class SCIENCE_NEWS extends StatefulWidget {
  const SCIENCE_NEWS({super.key});

  @override
  State<SCIENCE_NEWS> createState() => _SCIENCE_NEWSState();
}

class _SCIENCE_NEWSState extends State<SCIENCE_NEWS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            width: 100.w,
            color: Theme.of(context).appBarTheme.backgroundColor,
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
                      
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6.sp, right: 15.sp),
                    child: Text(
                      "science news",
                      style: TextStyle(
                          fontSize: 20.sp,
                         ),
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
            child: FutureBuilder(
              future: get_science_data(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return SingleChildScrollView(
                  child: Container(
                      width: 95.w,
                      height: 90.h,
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
                                      "index": index,
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
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "${Articles.fromJson(snapshot.data[index]).title}",
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
                                            Text(
                                                "${Articles.fromJson(snapshot.data[index]).publishedAt}"),
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                );
                              },
                            )),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
