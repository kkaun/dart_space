import 'package:dart_space/ui/search/search_state.dart';
import 'package:dart_space/ui/search/widget/centered_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_space/util/gradients.dart';
import 'package:dart_space/util/date_utils.dart';
import 'package:dart_space/ui/search/search_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kiwi/kiwi.dart' as kiwi;


class DailyInfoPage extends StatefulWidget {
  @override
  _DailyInfoPageState createState() => _DailyInfoPageState();
}

class _DailyInfoPageState extends State<DailyInfoPage> 
    with AutomaticKeepAliveClientMixin<DailyInfoPage> {

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
      //appBar: DailyInfoAppBar().build(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calendar_today),
        backgroundColor: Colors.black,
        tooltip: 'Open Calendar',
        onPressed: () => _selectDate(context),
      ),
      body: BlocBuilder(
        bloc: _searchBloc,
        builder: (context, SearchState state) {
          if(state.isInitial) {
            return CenteredMessage(
              message: 'Starting search...',
              iconData: Icons.ondemand_video
            );
          }
          if(state.isLoading) {
            return Center(
              child: CircularProgressIndicator()
            );
          }
          if(state.isSuccessful) {
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
        if(pageIndex == (searchState.getLastResultIndex() + 1)) {
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
        if(searchState.getLastResultIndex() < pageViewPosition) return _buildLoaderListItem();
        else {
          searchResult = searchState.getSearchResultFor(pageViewPosition);
        }
      } on RangeError {
        return _buildLoaderListItem();
      }
      //debugPrint("URL : ${searchResult?.url ?? ""}");
      //debugPrint("FINAL Media URL : ${searchResult?.getMediaContentUrl()}");

      return Container(
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
                child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[     
                  Container(
                      child: CachedNetworkImage(
                        imageUrl: searchResult?.getMediaContentUrl(),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, _imageLoadingError) => Icon(Icons.error),
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(searchResult?.title ?? "Title not present",     
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0, 
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 90),
                    child: Text(searchState.getTextFor(searchResult),
                          style: TextStyle(
                            fontSize: 14.0, 
                            color: Colors.black,
                          ),
                        ),
                  ),
                ],
              ),
            ),
        ),
        decoration: BoxDecoration(
          gradient: gradients[pageViewPosition % gradients.length],
        ),
      );
  }


  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995, 6, 17),
        lastDate: DateTime.now()
    );
    //if(picked != null) setState(() => _value = picked.toString());  //SET DATE AS EVENT!?
  }


  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

}