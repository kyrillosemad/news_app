import 'dart:convert';
import 'package:http/http.dart';

bool loading = true;
get_general_data() async {
  var jsondata = await get(Uri.parse(
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a46d762c40224fdab46f0cef6ee60f5c"));
  Map<String, dynamic> responseData = jsonDecode(jsondata.body);
  List<dynamic> dartdata = responseData['articles'];
  List<dynamic> filteredData = dartdata
      .where((item) => !item.values.any((value) => value == null))
      .toList();
  loading = false;
  return filteredData;
}
