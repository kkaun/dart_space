library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  DailyInfoSearchResult
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();