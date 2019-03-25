// GENERATED CODE - DO NOT MODIFY BY HAND

part of daily_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DailyInfoSearchResult> _$dailyInfoSearchResultSerializer =
    new _$DailyInfoSearchResultSerializer();

class _$DailyInfoSearchResultSerializer
    implements StructuredSerializer<DailyInfoSearchResult> {
  @override
  final Iterable<Type> types = const [
    DailyInfoSearchResult,
    _$DailyInfoSearchResult
  ];
  @override
  final String wireName = 'DailyInfoSearchResult';

  @override
  Iterable serialize(Serializers serializers, DailyInfoSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.copyright != null) {
      result
        ..add('copyright')
        ..add(serializers.serialize(object.copyright,
            specifiedType: const FullType(String)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.explanation != null) {
      result
        ..add('explanation')
        ..add(serializers.serialize(object.explanation,
            specifiedType: const FullType(String)));
    }
    if (object.hdurl != null) {
      result
        ..add('hdurl')
        ..add(serializers.serialize(object.hdurl,
            specifiedType: const FullType(String)));
    }
    if (object.media_type != null) {
      result
        ..add('media_type')
        ..add(serializers.serialize(object.media_type,
            specifiedType: const FullType(String)));
    }
    if (object.service_version != null) {
      result
        ..add('service_version')
        ..add(serializers.serialize(object.service_version,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  DailyInfoSearchResult deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DailyInfoSearchResultBuilder();

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
        case 'service_version':
          result.service_version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DailyInfoSearchResult extends DailyInfoSearchResult {
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
  @override
  final String service_version;
  @override
  final String title;
  @override
  final String url;

  factory _$DailyInfoSearchResult(
          [void updates(DailyInfoSearchResultBuilder b)]) =>
      (new DailyInfoSearchResultBuilder()..update(updates)).build();

  _$DailyInfoSearchResult._(
      {this.copyright,
      this.date,
      this.explanation,
      this.hdurl,
      this.media_type,
      this.service_version,
      this.title,
      this.url})
      : super._();

  @override
  DailyInfoSearchResult rebuild(void updates(DailyInfoSearchResultBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DailyInfoSearchResultBuilder toBuilder() =>
      new DailyInfoSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailyInfoSearchResult &&
        copyright == other.copyright &&
        date == other.date &&
        explanation == other.explanation &&
        hdurl == other.hdurl &&
        media_type == other.media_type &&
        service_version == other.service_version &&
        title == other.title &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, copyright.hashCode), date.hashCode),
                            explanation.hashCode),
                        hdurl.hashCode),
                    media_type.hashCode),
                service_version.hashCode),
            title.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DailyInfoSearchResult')
          ..add('copyright', copyright)
          ..add('date', date)
          ..add('explanation', explanation)
          ..add('hdurl', hdurl)
          ..add('media_type', media_type)
          ..add('service_version', service_version)
          ..add('title', title)
          ..add('url', url))
        .toString();
  }
}

class DailyInfoSearchResultBuilder
    implements Builder<DailyInfoSearchResult, DailyInfoSearchResultBuilder> {
  _$DailyInfoSearchResult _$v;

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

  String _service_version;
  String get service_version => _$this._service_version;
  set service_version(String service_version) =>
      _$this._service_version = service_version;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  DailyInfoSearchResultBuilder();

  DailyInfoSearchResultBuilder get _$this {
    if (_$v != null) {
      _copyright = _$v.copyright;
      _date = _$v.date;
      _explanation = _$v.explanation;
      _hdurl = _$v.hdurl;
      _media_type = _$v.media_type;
      _service_version = _$v.service_version;
      _title = _$v.title;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailyInfoSearchResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DailyInfoSearchResult;
  }

  @override
  void update(void updates(DailyInfoSearchResultBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DailyInfoSearchResult build() {
    final _$result = _$v ??
        new _$DailyInfoSearchResult._(
            copyright: copyright,
            date: date,
            explanation: explanation,
            hdurl: hdurl,
            media_type: media_type,
            service_version: service_version,
            title: title,
            url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
