import 'package:bloc/bloc.dart';
import 'package:dart_space/data/repository/daily_info_repository.dart';
import 'package:dart_space/ui/search/search_event.dart';
import 'package:dart_space/ui/search/search_state.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_error.dart';
import 'package:dart_space/util/date_utils.dart';
import 'package:flutter/material.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final DailyInfoRepository _dailyInfoRepository;

  SearchBloc(this._dailyInfoRepository) : super();

  @override
  SearchState get initialState => SearchState.initial();


  void onSwipeSearchInitiated() {
    debugPrint("IN BLOC - INITIAL");
    dispatch(DateInitialSearchEvent((b) => b..date = DateTime.now()));
  }

  void fetchNextSwipePage(DateTime date) {
    debugPrint("IN BLOC - NEXT PAGE");
    dispatch(DateNextSearchEvent((b) => b..date = date));
  }


  @override
  Stream<SearchState> mapEventToState(
    SearchState currentState,
    SearchEvent event,
  ) async* {
    debugPrint('IN BLOC - mapEventToState async!');
    if(event is DateInitialSearchEvent) {
      yield* mapInitialDailySearch(event);
    } else if(event is DateNextSearchEvent) {
      yield* mapNextDailySearch(event);
    }
  }

  Stream<SearchState> mapInitialDailySearch(DateInitialSearchEvent event) async* {
    if(event.date == null) {
      yield(SearchState.initial());
    } else {
      if(dateIsValid(event.date)) {
        yield(SearchState.loading());
        try {
          debugPrint('try/catch after SearchState.loading()');
          final searchResults = await _dailyInfoRepository.searchDailyInfo(false, event.date);
          yield SearchState.success(searchResults, event.date);
        } on DailyInfoSearchError catch(e) {
          yield SearchState.failure(e.message);
        } on NoSearchResultsException catch(e) {
          yield SearchState.failure(e.message);
        }
      } else yield SearchState.failure('Date is not valid!');
    }
  }

  Stream<SearchState> mapNextDailySearch(DateNextSearchEvent event) async* {
    if(dateIsValid(event.date)) {
      try {
        debugPrint("_____________IN mapNextDailySearch()");
        final searchResults = await _dailyInfoRepository.searchDailyInfo(false, event.date);
        yield SearchState.success(searchResults, event.date);
      } on DailyInfoSearchError catch(e) {
        yield SearchState.failure(e.message);
      } on NoSearchResultsException catch(e) {
        yield SearchState.failure(e.message);
      }
    } else yield SearchState.failure('Date is not valid!');
  }
}