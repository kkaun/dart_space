// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DateSearchEvent extends DateSearchEvent {
  @override
  final String date;

  factory _$DateSearchEvent([void updates(DateSearchEventBuilder b)]) =>
      (new DateSearchEventBuilder()..update(updates)).build();

  _$DateSearchEvent._({this.date}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('DateSearchEvent', 'date');
    }
  }

  @override
  DateSearchEvent rebuild(void updates(DateSearchEventBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DateSearchEventBuilder toBuilder() =>
      new DateSearchEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateSearchEvent && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateSearchEvent')..add('date', date))
        .toString();
  }
}

class DateSearchEventBuilder
    implements Builder<DateSearchEvent, DateSearchEventBuilder> {
  _$DateSearchEvent _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  DateSearchEventBuilder();

  DateSearchEventBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateSearchEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DateSearchEvent;
  }

  @override
  void update(void updates(DateSearchEventBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DateSearchEvent build() {
    final _$result = _$v ?? new _$DateSearchEvent._(date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
