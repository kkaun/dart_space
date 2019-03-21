library search_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';

part 'search_state.g.dart';

//TODO MAKE DATE UTIL for switching dates?

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  // fields go here
  bool get isLoading;

  // We HAVE to cache search results(add each next result to list), because every backward web request is expensive!
  BuiltList<DailyInfoSearchResult> get searchResults;

  String get error;

  bool get isInitial => 
      !isLoading && searchResults.isEmpty && error == '';
  bool get isSuccessful => 
      !isLoading && searchResults.isNotEmpty && error == '';

  SearchState._();

  factory SearchState([updates(SearchStateBuilder b)]) = _$SearchState;

  //Called when initially launching the app
  factory SearchState.initial() {
    return SearchState((b) => b
    ..isLoading = false
    ..searchResults.replace(BuiltList<DailyInfoSearchResult>())
    ..error = ''
    );
  }

  factory SearchState.loading() {
    return SearchState((b) => b
      ..isLoading = true
      ..searchResults.replace(BuiltList<DailyInfoSearchResult>())
      ..error = '');
  }

  factory SearchState.failure(String error) {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<DailyInfoSearchResult>())
      ..error = error);
  }

  factory SearchState.success(BuiltList<DailyInfoSearchResult> resultList) {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResults.replace(resultList)
      ..error = '');
  }
}