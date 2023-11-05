import 'dart:convert';

import 'package:gook_toon/models/webtoon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String todayApi = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final todayApiUrl = Uri.parse(baseUrl + todayApi);
    final response = await http.get(todayApiUrl);
    if (response.statusCode == 200) {
      List<dynamic> webtoonsJson = jsonDecode(response.body);
      final webtoons = webtoonsJson
          .map(
            (e) => WebtoonModel.fromJson(e),
          )
          .toList();
      return webtoons;
    } else {
      print("Status: ${response.statusCode}");
      throw Error();
    }
  }
}
