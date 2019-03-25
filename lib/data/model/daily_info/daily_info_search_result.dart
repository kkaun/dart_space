library daily_info;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_space/data/serializers/serializers.dart';

part 'daily_info_search_result.g.dart';

abstract class DailyInfoSearchResult implements Built<DailyInfoSearchResult, DailyInfoSearchResultBuilder> {
  // fields go here
  //TODO deal with possible nullables!
  @nullable
  @BuiltValueField(wireName: 'copyright')
  String get copyright;
  @nullable
  String get date;
  @nullable
  String get explanation;
  @nullable
  String get hdurl;
  @nullable
  String get media_type;
  @nullable
  String get service_version;
  @nullable
  String get title;
  @nullable
  String get url;

  DailyInfoSearchResult._();

  factory DailyInfoSearchResult([updates(DailyInfoSearchResultBuilder b)]) = _$DailyInfoSearchResult;

  String toJson() {
    return json.encode(serializers.serializeWith(DailyInfoSearchResult.serializer, this));
  }

  static DailyInfoSearchResult fromJson(String jsonString) {
    return serializers.deserializeWith(DailyInfoSearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<DailyInfoSearchResult> get serializer => _$dailyInfoSearchResultSerializer;
}