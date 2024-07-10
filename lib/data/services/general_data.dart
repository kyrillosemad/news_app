import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/models/news_model.dart';

bool loading = true;
Future<List<Articles>> getGeneralData() async {
  final response = await get(Uri.parse(
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a46d762c40224fdab46f0cef6ee60f5c"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<dynamic> dartData = data['articles'];
    List<dynamic> filteredData = dartData
        .where((item) => !item.values.any((value) => value == null))
        .toList();
    List<Articles> finalData =
        filteredData.map((json) => Articles.fromJson(json)).toList();
    loading = false;
    return finalData;
  } else {
    throw Exception("there's something wrong");
  }
}
