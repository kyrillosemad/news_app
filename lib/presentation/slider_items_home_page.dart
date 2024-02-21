import 'package:flutter/material.dart';
import 'package:news_app/data/general_data.dart';
import 'package:news_app/modules/news_model.dart';
import 'package:sizer/sizer.dart';

class slider_items extends StatelessWidget {
  const slider_items(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_general_data(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Container(
                margin: EdgeInsets.all(5.sp),
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
                padding: EdgeInsets.all(5.sp),
                margin: EdgeInsets.all(5.sp),
                width: 92.w,
                height: 30.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${Articles.fromJson(snapshot.data[index]).urlToImage}"),
                        fit: BoxFit.fill)),
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
                      child: Text(
                        "${Articles.fromJson(snapshot.data[index]).title}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      width: 100.w,
                      height: 10.h,
                    )
                  ],
                ),
              );
      },
    );
  }
}
