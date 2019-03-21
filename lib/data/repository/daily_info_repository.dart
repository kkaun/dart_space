
import 'package:built_collection/built_collection.dart';

import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';
import 'package:dart_space/data/network/daily_info_data_source.dart';

class DailyInfoRepository {

  DailyInfoDataSource _dailyInfoDataSource;

  //String _lastSearchQuery;
  //String _nextPageToken;

  String currentSearchDate;


  DailyInfoRepository(this._dailyInfoDataSource);

  Future<DailyInfoSearchResult> searchNextDailyInfo(String query) async {
    final searchResult = await _dailyInfoDataSource.searchVideos(query: query);
    _cacheValues(query: query, nextPageToken: searchResult.nextPageToken);
    if (searchResult.items.isEmpty) throw NoSearchResultsException();
    return searchResult.items;
  }

  void _cacheValues({String query, String nextPageToken}) {
    _lastSearchQuery = query;
    _nextPageToken = nextPageToken;
  }

  
  
}

class NoSearchResultsException implements Exception {
  final message = 'No results';
}

class SearchNotInitiatedException implements Exception {
  final message = 'Cannot get the next result page without searching first';
}

class NoNextPageTokenException implements Exception {}
