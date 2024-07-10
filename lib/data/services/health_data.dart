import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:news_app/models/news_model.dart';

Future<List<Articles>> getHealthDAta() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=a46d762c40224fdab46f0cef6ee60f5c"));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['articles'];
    List<dynamic> filteredData = data
        .where((item) => !item.values.any((value) => value == null))
        .toList();
    List<Articles> finalData =
        filteredData.map((json) => Articles.fromJson(json)).toList();
    return finalData;
  } else {
    throw Exception("there's something wrong");
  }
}
