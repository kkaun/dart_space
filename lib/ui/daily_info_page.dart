import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';
import 'package:dart_space/ui/search/search_state.dart';
import 'package:dart_space/ui/centered_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_space/util/gradients.dart';
import 'package:dart_space/util/date_utils.dart';
import 'package:dart_space/ui/search/search_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';


class DailyInfoPages extends StatefulWidget {
  @override
  _DailyInfoPagesState createState() => _DailyInfoPagesState();
}

class _DailyInfoPagesState extends State<DailyInfoPages> 
    with AutomaticKeepAliveClientMixin<DailyInfoPages> {

  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _pageController = PageController();

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calendar_today),
        backgroundColor: Colors.black54,
        tooltip: 'Open Calendar',
        onPressed: () => _selectDate(context),
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: _searchBloc,
          builder: (context, SearchState state) {
            if(state.isInitial) {
              return CenteredMessage(
                message: 'Starting search...',
                iconData: Icons.timelapse
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
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, position) {
        //TODO Handle case when scrolling pageview too fast so it loads same results on further pages
        //debugPrint("_________________________POSITION : $position");
        //debugPrint("_________________________LAST RESULT INDEX : ${searchState.getLastResultIndex()}");
        return _buildPage(position, searchState);
      },
    );
  }

  Widget _buildPage(int pageViewPosition, SearchState searchState) {
    
      DailyInfoSearchResult searchResult;
      
      try {
        if(searchState.getLastResultIndex() < pageViewPosition) return _buildLoaderListItem();
        else {
          searchResult = searchState.getSearchResultFor(pageViewPosition);
        }
      } on RangeError {
        return _buildLoaderListItem();
      }

      return Container(
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[     
                  Container(
                    child: CachedNetworkImage(
                        imageUrl: searchResult.getMediaContentUrl(),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, _imageLoadingError) => Icon(Icons.error),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {
                          _launchURL(searchResult.url ?? ''); 
                        },
                        child: _getContentMarkerIcon(searchResult.media_type ?? ''),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black54,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: ShapeDecoration(
                            color: Colors.black54,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white30, width: 2),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        child: Text(searchResult.date,     
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'VT323',
                              fontSize: 19.0, 
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          shareSearchItemInfo(searchResult);
                        },
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black54,
                        padding: const EdgeInsets.all(15.0),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 15, right: 20),
                      child: Text(searchResult.title ?? "Title not present",     
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.0, 
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 90),
                      child: Text(searchResult.getMainText(),
                            style: TextStyle(
                              fontFamily: 'VT323',
                              fontSize: 16.0, 
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


  void shareSearchItemInfo(DailyInfoSearchResult searchResult) {
    StringBuffer sb = StringBuffer();
    sb.writeAll([searchResult.title ?? '', 
    '\n\n', 'Date published: ', searchResult.date, 
    '\n\n', searchResult.getMainText(), 
    '\n\n', 'Media URL : ', searchResult.url ?? '']);
    final strToShare = sb.toString();
    Share.share(strToShare);
  }


  Icon _getContentMarkerIcon(String mediaType) {
    if(mediaType == 'video') 
    return Icon(
        Icons.ondemand_video,
        color: Colors.white,
        size: 18.0,);
    else return Icon(
        Icons.image,
        color: Colors.white,
        size: 18.0,);
  }


  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995, 6, 17),
        lastDate: DateTime.now()
    );
    if(picked != null) _searchBloc.onDatePickSearchInitiated(picked);  //SET DATE AS EVENT!?
  }


  _launchURL(String mediaUrl) async {
    if (await canLaunch(mediaUrl)) {
      await launch(mediaUrl);
    } else { } //TODO
  }


  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

}