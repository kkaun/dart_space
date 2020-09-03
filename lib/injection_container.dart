import 'package:dart_space/data/network/daily_info_data_source.dart';
import 'package:dart_space/data/repository/daily_info_repository.dart';
import 'package:dart_space/ui/search/search_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi() {
  kiwi.KiwiContainer()
    ..registerInstance(http.Client())
    ..registerFactory((c) => DailyInfoDataSource(c.resolve()))
    ..registerFactory((c) => DailyInfoRepository(c.resolve()))
    ..registerFactory((c) => SearchBloc(c.resolve()));
}
