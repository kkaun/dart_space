import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:dart_space/data/model/daily_info/daily_info_search_error.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';
import 'api_key.dart';

class DailyInfoDataSource {

  final http.Client client;

  final String _searchBaseUrl = 'https://api.nasa.gov/planetary/apod?api_key=$API_KEY';

  DailyInfoDataSource(this.client);

  Future<DailyInfoSearchResult> searchDailyInfo(
    String date,) async {
      final urlRaw = _searchBaseUrl + '&date=$date';

      final urlEncoded = Uri.encodeFull(urlRaw);
      final response = await client.get(urlEncoded);

      if (response.statusCode == 200) {
        return DailyInfoSearchResult.fromJson(response.body);
      } else {
        throw DailyInfoSearchError(json.decode(response.body)['msg']);
      }
  }
}
