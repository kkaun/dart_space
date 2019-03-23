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
      !isLoading && searchResultList.isEmpty == null && error == '';
  bool get isSuccessful => 
      !isLoading && searchResultList.isNotEmpty != null && error == '';

  SearchState._();

  factory SearchState([updates(SearchStateBuilder b)]) = _$SearchState;

  //Called when initially launching the app
  factory SearchState.initial() {
    return SearchState((b) => b
    ..isLoading = false
    ..searchResultList.replace(List<DailyInfoSearchResult>())
    ..error = ''
    );
  }

  factory SearchState.loading() {
    return SearchState((b) => b
      ..isLoading = true
      //..searchResultList.replace(BuiltList<DailyInfoSearchResult>()) TODO?
      ..error = '');
  }

  factory SearchState.failure(String error) {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResultList.replace(BuiltList<DailyInfoSearchResult>())
      ..error = error);
  }

  factory SearchState.success(DailyInfoSearchResult result, DateTime nextDate) {
    return SearchState((b) => b
      ..isLoading = false
      ..currentDate = nextDate
      ..searchResultList.add(result)
      ..error = '');
  }
}