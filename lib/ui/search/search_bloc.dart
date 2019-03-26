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
  SearchState get initialState => SearchState.initial(DateTime.now());


  void onSwipeSearchInitiated() {
    dispatch(DateInitialSearchEvent((b) => b..date = DateTime.now()));
  }

  void onDatePickSearchInitiated(DateTime pickedDate) {
    dispatch(DateChosenSearchEvent((b) => b.date = pickedDate));
  }

  void fetchNextSwipePage(DateTime nextDate) {
    dispatch(DateNextSearchEvent((b) => b..date = nextDate));
  }


  @override
  Stream<SearchState> mapEventToState(
    SearchState currentState,
    SearchEvent event,
  ) async* {
    if(event is DateInitialSearchEvent) {
      yield* mapInitialDailySearch(event);
    } else if(event is DateChosenSearchEvent) {
      yield* mapPickedDateDailySearch(event);
    } else if(event is DateNextSearchEvent) {
      yield* mapNextDailySearch(event);
    }
  }

  Stream<SearchState> mapInitialDailySearch(DateInitialSearchEvent event) async* {
    if(event.date == null) {
      yield(SearchState.initial(DateTime.now()));
    } else {
      if(dateIsValid(event.date)) {
        yield(SearchState.loading(DateTime.now()));
        try {
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

  Stream<SearchState> mapPickedDateDailySearch(DateChosenSearchEvent event) async* {
    if(event.date == null) {
      yield(SearchState.initial(event.date));
    } else {
      if(dateIsValid(event.date)) {
        yield(SearchState.loading(event.date));
        try {
          final searchResults = await _dailyInfoRepository.searchDailyInfo(true, event.date);
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