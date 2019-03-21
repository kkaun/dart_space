import 'package:bloc/bloc.dart';
import 'package:dart_space/ui/search/search_event.dart';
import 'package:dart_space/ui/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {



  @override
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(
    SearchState currentState,
    SearchEvent event,
  ) async* {
    // TODO: implement mapEventToState

  }


}