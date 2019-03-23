import 'package:dart_space/ui/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_space/util/gradients.dart';
import 'package:dart_space/util/date_utils.dart';
import 'package:dart_space/ui/search/search_bloc.dart';
import 'package:dart_space/ui/search/widget/app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_error.dart';
import 'package:kiwi/kiwi.dart' as kiwi;


class DailyInfoPage extends StatefulWidget {
  @override
  _DailyInfoPageState createState() => _DailyInfoPageState();
}

class _DailyInfoPageState extends State<DailyInfoPage> {

  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _pageController = PageController();
  final _imageLoadingError = 'Loading Image Failed';

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
          return _buildResultViewPage(state);
        },
      ),
    );
  }


  Widget _buildResultViewPage(SearchState searchState) {
    return NotificationListener<ScrollNotification>(
      onNotification: (n) => _handleScrollNotification(n, searchState),

      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, position) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[       
                    Flexible(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl: searchState.searchResultList[position].hdurl,
                        placeholder: (context, hdurl) => CircularProgressIndicator(),
                        errorWidget: (context, hdurl, _imageLoadingError) => Icon(Icons.error),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'TEXT1',
                                //WordData.greData[position].wordTitle,
                                style: TextStyle(color: Colors.white, fontSize: 30.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: gradients[position % gradients.length],
                ),
              ),
            ],
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification, SearchState state) {
    if(notification is ScrollEndNotification) {
      _searchBloc.fetchNextSwipePage(getNextDateFrom(state.currentDate));
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

}