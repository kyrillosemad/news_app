import 'dart:convert';
import 'package:http/http.dart';

get_sports_data() async {
  var jsondata = await get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=a46d762c40224fdab46f0cef6ee60f5c"));
  Map<String, dynamic> responseData = jsonDecode(jsondata.body);
  List<dynamic> dartdata = responseData['articles'];
  List<dynamic> filteredData = dartdata
      .where((item) => !item.values.any((value) => value == null))
      .toList();

  return filteredData;
}