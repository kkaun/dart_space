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

class _DailyInfoPageState extends State<DailyInfoPage> {

  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _pageController = PageController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
            return Center(
              child: CircularProgressIndicator()
            );
          }
          if(state.isSuccessful) {
            return _buildResultViewPage(state);
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


  Widget _buildResultViewPage(SearchState searchState) {
    return buildItemDependingOnState(searchState);
  }


  Widget buildItemDependingOnState(SearchState searchState) {
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
        _searchBloc.fetchNextSwipePage(getPreviousDateFrom(searchState.currentDate));
      },
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      //itemCount: searchState.getResultCount() + 1,
      itemBuilder: (context, position) {
        debugPrint("--------------- PAGE POSITION : $position");
        debugPrint("--------------- LAST RESULT INDEX: ${searchState.getLastResultIndex()}");
        //debugPrint("-------------------CURRENT RESULTS : ${searchState.searchResultList.toString()}");
        debugPrint("----------------------- CURRENT RESULTS SIZE: ${searchState.searchResultList.length}");
        if(searchState.getLastResultIndex() == position) {
          return _buildPage(true, position, searchState);
        } else {
          return _buildPage(false, position, searchState);
        }
      },
    );
  }


  Widget _buildPage(bool isCurrentPageDataReady, int pageViewPosition, SearchState searchState) {
    if(isCurrentPageDataReady) {
      final searchResult = searchState.getSearchResultFor(pageViewPosition);
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
                    imageUrl: searchResult.hdurl ?? searchResult.url ?? "",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, _imageLoadingError) => Icon(Icons.error),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(searchResult.title ?? "Title not present",     
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
    } else {
      return _buildLoaderListItem();
    }
  }


  // bool _handleScrollNotification(ScrollNotification notification, SearchState state) {
  //   if(notification is ScrollEndNotification) {
  //     debugPrint("SCROLL END NOTIFACATION");
  //     _searchBloc.fetchNextSwipePage(getPreviousDateFrom(state.currentDate));
  //   }
  //   return false;
  // }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

}