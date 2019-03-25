library search_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';

part 'search_state.g.dart';

//TODO MAKE DATE UTIL for switching dates?

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  // fields go here
  // We HAVE to cache search results(add each next result to list), because every backward web request is expensive!
  BuiltList<DailyInfoSearchResult> get searchResultList;
  String get error;
  DateTime get currentDate;
  bool get isLoading;

  bool get isInitial => 
      isLoading && searchResultList.isEmpty == null && error == '';
  bool get isSuccessful => 
      !isLoading && searchResultList.isNotEmpty != null && error == '';

  SearchState._();

  factory SearchState([updates(SearchStateBuilder b)]) = _$SearchState;

  //Called when initially launching the app
  factory SearchState.initial() {
    print('STATE ---------------- initial()');
    return SearchState((b) => b
    ..isLoading = false
    ..currentDate = DateTime.now()
    ..searchResultList.replace(List<DailyInfoSearchResult>())
    ..error = ''
    );
  }

  factory SearchState.loading() {
    print('STATE ---------------- loading()');
    return SearchState((b) => b
      ..isLoading = true
      ..currentDate = DateTime.now()
      ..searchResultList.replace(BuiltList<DailyInfoSearchResult>())
      ..error = '');
  }

  factory SearchState.failure(String error) {
    print('STATE ---------------- failure()');
    return SearchState((b) => b
      ..isLoading = false
      ..searchResultList.replace(BuiltList<DailyInfoSearchResult>())
      ..error = error);
  }

  factory SearchState.success(List<DailyInfoSearchResult> resultList, DateTime nextDate) {
    print('STATE ---------------- success(), SEARCH RESULTS SIZE : ${resultList.length}');
    return SearchState((b) => b
      ..isLoading = false
      ..currentDate = nextDate
      ..searchResultList.replace(resultList)
      ..error = '');
  }

  DailyInfoSearchResult getSearchResultFor(int position) => searchResultList[position];

  String getTextFor(DailyInfoSearchResult searchResult) {
    final _dailyInfoExplanation = searchResult.explanation ?? "No Explanation provided";
    final _dailyInfoCopyright = searchResult.copyright ?? "No Copyright info provided";
    return _dailyInfoCopyright + '\n' + _dailyInfoExplanation;
  }

  int getResultCount() => searchResultList.length;

  int getLastResultIndex() => searchResultList.length - 1;
}