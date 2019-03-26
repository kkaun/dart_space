library search_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';
part 'search_state.g.dart';

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
  factory SearchState.initial(DateTime date) {
    return SearchState((b) => b
    ..isLoading = false
    ..currentDate = date
    ..searchResultList.replace(BuiltList<DailyInfoSearchResult>())
    ..error = ''
    );
  }

  factory SearchState.loading(DateTime date) {
    return SearchState((b) => b
      ..isLoading = true
      ..currentDate = date
      ..searchResultList.replace(BuiltList<DailyInfoSearchResult>())
      ..error = '');
  }

  factory SearchState.success(List<DailyInfoSearchResult> resultList, DateTime nextDate) {
    return SearchState((b) => b
      ..isLoading = false
      ..currentDate = nextDate
      ..searchResultList.replace(resultList)
      ..error = '');
  }

  factory SearchState.failure(String error) {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResultList.replace(BuiltList<DailyInfoSearchResult>())
      ..error = error);
  }

  DailyInfoSearchResult getSearchResultFor(int position) => searchResultList[position];

  int getResultCount() => searchResultList.length;

  int getLastResultIndex() => searchResultList.length - 1;
}