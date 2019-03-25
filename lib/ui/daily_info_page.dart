import 'package:dart_space/ui/search/search_state.dart';
import 'package:dart_space/ui/search/widget/centered_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_space/util/gradients.dart';
import 'package:dart_space/util/date_utils.dart';
import 'package:dart_space/ui/search/search_bloc.dart';
import 'package:dart_space/ui/search/widget/app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kiwi/kiwi.dart' as kiwi;


class DailyInfoPage extends StatefulWidget {
  @override
  _DailyInfoPageState createState() => _DailyInfoPageState();
}

class _DailyInfoPageState extends State<DailyInfoPage> with 
                  AutomaticKeepAliveClientMixin<DailyInfoPage> {

  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  //final _pageController = PageController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _searchBloc.onSwipeSearchInitiated();
    return BlocProvider(
      bloc: _searchBloc,
      child: _buildScaffold(),
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: DailyInfoAppBar().build(context),
      body: BlocBuilder(
        bloc: _searchBloc,
        builder: (context, SearchState state) {
          if(state.isInitial) {
            return CenteredMessage(
              message: 'Start searching!',
              iconData: Icons.ondemand_video
            );
          }
          if(state.isLoading) {
            debugPrint("UI-------------LOADING!");
            return Center(
              child: CircularProgressIndicator()
            );
          }
          if(state.isSuccessful) {
            debugPrint("UI-------------SUCCESS!");
            return _buildItemDependingOnState(state);
          } else { //error
            return CenteredMessage(
              message: state.error,
              iconData: Icons.error_outline,
            );
          }
        },
      ),
    );
  }

  Widget _buildItemDependingOnState(SearchState searchState) {
    debugPrint("buildItemDependingOnState - results length: ${searchState.searchResultList.length}");
    return searchState.searchResultList.length <= 0 ? _buildLoaderListItem() : _buildPageView(searchState);
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildPageView(SearchState searchState) {
    return PageView.builder(
      onPageChanged: (pageIndex) {
        debugPrint("============ON PAGE CHANGED!!!!!!!!!!!");
        if(pageIndex == (searchState.getLastResultIndex() + 1)) {
          debugPrint("============   pageIndex > searchState.getLastResultIndex()");
          _searchBloc.fetchNextSwipePage(getPreviousDateFrom(searchState.currentDate));
        }
      },
      //controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, position) {
          return _buildPage(position, searchState);
      },
    );
  }

  Widget _buildPage(int pageViewPosition, SearchState searchState) {
    
    var searchResult;
    
    try {
      if(searchState.getLastResultIndex() < pageViewPosition) { 
        return _buildLoaderListItem();
      }
      else { 
        searchResult = searchState.getSearchResultFor(pageViewPosition);
      }
    } on RangeError {
      return _buildLoaderListItem();
    }
      debugPrint("URL : ${searchResult?.url ?? ""}");
      debugPrint("FINAL Media URL : ${searchResult?.getMediaContentUrl()}");

      return Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[       
                Flexible(
                  flex: 8,
                  child: CachedNetworkImage(
                    imageUrl: searchResult?.getMediaContentUrl(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, _imageLoadingError) => Icon(Icons.error),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(searchResult?.title ?? "Title not present",     
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0, 
                        color: Colors.black,
                      ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    child: Text(searchState.getTextFor(searchResult),
                      style: TextStyle(
                        fontSize: 14.0, 
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              gradient: gradients[pageViewPosition % gradients.length],
            ),
          ),
        ],
      );
    
  }


  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

}