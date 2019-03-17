// GENERATED CODE - DO NOT MODIFY BY HAND

part of daily_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DailyInfo> _$dailyInfoSerializer = new _$DailyInfoSerializer();

class _$DailyInfoSerializer implements StructuredSerializer<DailyInfo> {
  @override
  final Iterable<Type> types = const [DailyInfo, _$DailyInfo];
  @override
  final String wireName = 'DailyInfo';

  @override
  Iterable serialize(Serializers serializers, DailyInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'copyright',
      serializers.serialize(object.copyright,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'explanation',
      serializers.serialize(object.explanation,
          specifiedType: const FullType(String)),
      'hdurl',
      serializers.serialize(object.hdurl,
          specifiedType: const FullType(String)),
      'media_type',
      serializers.serialize(object.media_type,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DailyInfo deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DailyInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'copyright':
          result.copyright = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'explanation':
          result.explanation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hdurl':
          result.hdurl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'media_type':
          result.media_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DailyInfo extends DailyInfo {
  @override
  final String copyright;
  @override
  final String date;
  @override
  final String explanation;
  @override
  final String hdurl;
  @override
  final String media_type;

  factory _$DailyInfo([void updates(DailyInfoBuilder b)]) =>
      (new DailyInfoBuilder()..update(updates)).build();

  _$DailyInfo._(
      {this.copyright,
      this.date,
      this.explanation,
      this.hdurl,
      this.media_type})
      : super._() {
    if (copyright == null) {
      throw new BuiltValueNullFieldError('DailyInfo', 'copyright');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('DailyInfo', 'date');
    }
    if (explanation == null) {
      throw new BuiltValueNullFieldError('DailyInfo', 'explanation');
    }
    if (hdurl == null) {
      throw new BuiltValueNullFieldError('DailyInfo', 'hdurl');
    }
    if (media_type == null) {
      throw new BuiltValueNullFieldError('DailyInfo', 'media_type');
    }
  }

  @override
  DailyInfo rebuild(void updates(DailyInfoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DailyInfoBuilder toBuilder() => new DailyInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailyInfo &&
        copyright == other.copyright &&
        date == other.date &&
        explanation == other.explanation &&
        hdurl == other.hdurl &&
        media_type == other.media_type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, copyright.hashCode), date.hashCode),
                explanation.hashCode),
            hdurl.hashCode),
        media_type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DailyInfo')
          ..add('copyright', copyright)
          ..add('date', date)
          ..add('explanation', explanation)
          ..add('hdurl', hdurl)
          ..add('media_type', media_type))
        .toString();
  }
}

class DailyInfoBuilder implements Builder<DailyInfo, DailyInfoBuilder> {
  _$DailyInfo _$v;

  String _copyright;
  String get copyright => _$this._copyright;
  set copyright(String copyright) => _$this._copyright = copyright;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _explanation;
  String get explanation => _$this._explanation;
  set explanation(String explanation) => _$this._explanation = explanation;

  String _hdurl;
  String get hdurl => _$this._hdurl;
  set hdurl(String hdurl) => _$this._hdurl = hdurl;

  String _media_type;
  String get media_type => _$this._media_type;
  set media_type(String media_type) => _$this._media_type = media_type;

  DailyInfoBuilder();

  DailyInfoBuilder get _$this {
    if (_$v != null) {
      _copyright = _$v.copyright;
      _date = _$v.date;
      _explanation = _$v.explanation;
      _hdurl = _$v.hdurl;
      _media_type = _$v.media_type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailyInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DailyInfo;
  }

  @override
  void update(void updates(DailyInfoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DailyInfo build() {
    final _$result = _$v ??
        new _$DailyInfo._(
            copyright: copyright,
            date: date,
            explanation: explanation,
            hdurl: hdurl,
            media_type: media_type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
