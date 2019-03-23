
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';
import 'package:dart_space/data/network/daily_info_data_source.dart';
import 'package:dart_space/util/date_utils.dart';

class DailyInfoRepository {

  DailyInfoDataSource _dailyInfoDataSource;

  DateTime currentSearchDate;

  DailyInfoRepository(this._dailyInfoDataSource);

  Future<DailyInfoSearchResult> searchDailyInfo(DateTime currentDate, bool clearCache) async {
    final searchResult = await _dailyInfoDataSource.searchDailyInfo(baseFormatter.format(currentDate));
    currentSearchDate = currentDate;
    return searchResult;
  }
}

class NoSearchResultsException implements Exception {
  final message = 'No results';
}

class SearchNotInitiatedException implements Exception {
  final message = 'Cannot get the next result page without searching first';
}

class NoNextPageTokenException implements Exception {}
