library daily_info;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'daily_info.g.dart';

abstract class DailyInfo implements Built<DailyInfo, DailyInfoBuilder> {
  // fields go here
  String get copyright;
  String get date;
  String get explanation;
  String get hdurl;
  String get media_type;

  DailyInfo._();

  factory DailyInfo([updates(DailyInfoBuilder b)]) = _$DailyInfo;

  String toJson() {
    return json.encode(serializers.serializeWith(DailyInfo.serializer, this));
  }

  static DailyInfo fromJson(String jsonString) {
    return serializers.deserializeWith(DailyInfo.serializer, json.decode(jsonString));
  }

  static Serializer<DailyInfo> get serializer => _$DailyInfoSerializer;
}