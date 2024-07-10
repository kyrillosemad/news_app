// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/news_details.dart';
import 'package:news_app/view/shared_widgets/news_container.dart';
import 'package:sizer/sizer.dart';

class LoadedSTate extends StatelessWidget {
  final state;
  const LoadedSTate({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: 97.w,
          height: 90.h,
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(
                    const NewsDetails(),
                    arguments: {
                      "image": state[index].urlToImage,
                      "author": state[index].author,
                      "title":state[index].title,
                      "content": state[index].content,
                      "publishat": state[index].publishedAt,
                      "index": index,
                    },
                  );
                },
                child: NewsContainer(index: index, news: state),
              );
            },
          )),
    );
  }
}
