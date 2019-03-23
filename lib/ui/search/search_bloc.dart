import 'package:bloc/bloc.dart';
import 'package:dart_space/data/repository/daily_info_repository.dart';
import 'package:dart_space/ui/search/search_event.dart';
import 'package:dart_space/ui/search/search_state.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_error.dart';
import 'package:dart_space/util/date_utils.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final DailyInfoRepository _dailyInfoRepository;

  SearchBloc(this._dailyInfoRepository) : super();

  @override
  SearchState get initialState => SearchState.initial();


  void onSwipeSearchInitiated() {
    dispatch(DateInitialSearchEvent((b) => b..date = DateTime.now()));
  }

  void fetchNextSwipePage(DateTime date) {
    dispatch(DateInitialSearchEvent((b) => b..date = date));
  }


  @override
  Stream<SearchState> mapEventToState(
    SearchState currentState,
    SearchEvent event,
  ) async* {
    if(event is DateInitialSearchEvent) {
      mapInitialDailySearch(event);
    } else if(event is DateNextSearchEvent) {
      mapNextDailySearch(event);
    }
  }

  Stream<SearchState> mapInitialDailySearch(DateInitialSearchEvent event) async* {
    if(event.date == null) {
      yield(SearchState.initial());
    } else {
      if(dateIsValid(event.date)) {
        yield(SearchState.loading());
        try {
          final searchResult = await _dailyInfoRepository.searchDailyInfo(event.date, true);
          yield SearchState.success(searchResult, event.date);
        } on DailyInfoSearchError catch(e) {
          yield SearchState.failure(e.message);
        } on NoSearchResultsException catch(e) {
          yield SearchState.failure(e.message);
        }
      }
    }
  }

  Stream<SearchState> mapNextDailySearch(DateNextSearchEvent event) async* {
    if(dateIsValid(event.date)) {
      yield(SearchState.loading());
      try {
        final searchResult = await _dailyInfoRepository.searchDailyInfo(event.date, false);
        yield SearchState.success(searchResult, event.date);
      } on DailyInfoSearchError catch(e) {
        yield SearchState.failure(e.message);
      } on NoSearchResultsException catch(e) {
        yield SearchState.failure(e.message);
      }
    }
  }
}