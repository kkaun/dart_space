library search_event;

import 'package:built_value/built_value.dart';

part 'search_event.g.dart';

abstract class SearchEvent {}

abstract class DateInitialSearchEvent extends SearchEvent
implements Built<DateInitialSearchEvent, DateInitialSearchEventBuilder> {
  // fields go here
  DateTime get date;

  DateInitialSearchEvent._();

  factory DateInitialSearchEvent([updates(DateInitialSearchEventBuilder b)]) = _$DateInitialSearchEvent;
}

abstract class DateNextSearchEvent  extends SearchEvent
implements Built<DateNextSearchEvent, DateNextSearchEventBuilder> {
  // fields go here
  DateTime get date;
  
  DateNextSearchEvent._();

  factory DateNextSearchEvent([updates(DateNextSearchEventBuilder b)]) = _$DateNextSearchEvent;
}
