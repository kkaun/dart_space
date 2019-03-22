// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DateInitialSearchEvent extends DateInitialSearchEvent {
  @override
  final DateTime date;

  factory _$DateInitialSearchEvent(
          [void updates(DateInitialSearchEventBuilder b)]) =>
      (new DateInitialSearchEventBuilder()..update(updates)).build();

  _$DateInitialSearchEvent._({this.date}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('DateInitialSearchEvent', 'date');
    }
  }

  @override
  DateInitialSearchEvent rebuild(
          void updates(DateInitialSearchEventBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DateInitialSearchEventBuilder toBuilder() =>
      new DateInitialSearchEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateInitialSearchEvent && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateInitialSearchEvent')
          ..add('date', date))
        .toString();
  }
}

class DateInitialSearchEventBuilder
    implements Builder<DateInitialSearchEvent, DateInitialSearchEventBuilder> {
  _$DateInitialSearchEvent _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DateInitialSearchEventBuilder();

  DateInitialSearchEventBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateInitialSearchEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DateInitialSearchEvent;
  }

  @override
  void update(void updates(DateInitialSearchEventBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DateInitialSearchEvent build() {
    final _$result = _$v ?? new _$DateInitialSearchEvent._(date: date);
    replace(_$result);
    return _$result;
  }
}

class _$DateNextSearchEvent extends DateNextSearchEvent {
  @override
  final DateTime date;

  factory _$DateNextSearchEvent([void updates(DateNextSearchEventBuilder b)]) =>
      (new DateNextSearchEventBuilder()..update(updates)).build();

  _$DateNextSearchEvent._({this.date}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('DateNextSearchEvent', 'date');
    }
  }

  @override
  DateNextSearchEvent rebuild(void updates(DateNextSearchEventBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DateNextSearchEventBuilder toBuilder() =>
      new DateNextSearchEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateNextSearchEvent && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateNextSearchEvent')
          ..add('date', date))
        .toString();
  }
}

class DateNextSearchEventBuilder
    implements Builder<DateNextSearchEvent, DateNextSearchEventBuilder> {
  _$DateNextSearchEvent _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DateNextSearchEventBuilder();

  DateNextSearchEventBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateNextSearchEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DateNextSearchEvent;
  }

  @override
  void update(void updates(DateNextSearchEventBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DateNextSearchEvent build() {
    final _$result = _$v ?? new _$DateNextSearchEvent._(date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
