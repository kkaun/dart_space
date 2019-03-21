library search_event;

import 'package:built_value/built_value.dart';

part 'search_event.g.dart';

abstract class SearchEvent {}

abstract class DateSearchEvent implements Built<DateSearchEvent, DateSearchEventBuilder> {
  // fields go here
  String get date;

  DateSearchEvent._();

  factory DateSearchEvent([updates(DateSearchEventBuilder b)]) = _$DateSearchEvent;
}
