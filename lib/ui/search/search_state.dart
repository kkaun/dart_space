library search_state;

import 'package:built_value/built_value.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';

part 'search_state.g.dart';

//TODO MAKE DATE UTIL for switching dates?

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  // fields go here
  bool get isLoading;

  // We HAVE to cache search results(add each next result to list), because every backward web request is expensive!
  DailyInfoSearchResult get currentSearchResult;

  String get error;

  bool get isInitial => 
      !isLoading && currentSearchResult == null && error == '';
  bool get isSuccessful => 
      !isLoading && currentSearchResult != null && error == '';

  SearchState._();

  factory SearchState([updates(SearchStateBuilder b)]) = _$SearchState;

  //Called when initially launching the app
  factory SearchState.initial() {
    return SearchState((b) => b
    ..isLoading = false
    ..currentSearchResult.replace(null)
    ..error = ''
    );
  }

  factory SearchState.loading() {
    return SearchState((b) => b
      ..isLoading = true
      ..error = '');
  }

  factory SearchState.failure(String error) {
    return SearchState((b) => b
      ..isLoading = false
      ..error = error);
  }

  factory SearchState.success(DailyInfoSearchResult result) {
    return SearchState((b) => b
      ..isLoading = false
      ..currentSearchResult.replace(result)
      ..error = '');
  }
}