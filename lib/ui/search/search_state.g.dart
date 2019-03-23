// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchState extends SearchState {
  @override
  final BuiltList<DailyInfoSearchResult> searchResultList;
  @override
  final String error;
  @override
  final DateTime currentDate;
  @override
  final bool isLoading;

  factory _$SearchState([void updates(SearchStateBuilder b)]) =>
      (new SearchStateBuilder()..update(updates)).build();

  _$SearchState._(
      {this.searchResultList, this.error, this.currentDate, this.isLoading})
      : super._() {
    if (searchResultList == null) {
      throw new BuiltValueNullFieldError('SearchState', 'searchResultList');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('SearchState', 'error');
    }
    if (currentDate == null) {
      throw new BuiltValueNullFieldError('SearchState', 'currentDate');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SearchState', 'isLoading');
    }
  }

  @override
  SearchState rebuild(void updates(SearchStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchStateBuilder toBuilder() => new SearchStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchState &&
        searchResultList == other.searchResultList &&
        error == other.error &&
        currentDate == other.currentDate &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, searchResultList.hashCode), error.hashCode),
            currentDate.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchState')
          ..add('searchResultList', searchResultList)
          ..add('error', error)
          ..add('currentDate', currentDate)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class SearchStateBuilder implements Builder<SearchState, SearchStateBuilder> {
  _$SearchState _$v;

  ListBuilder<DailyInfoSearchResult> _searchResultList;
  ListBuilder<DailyInfoSearchResult> get searchResultList =>
      _$this._searchResultList ??= new ListBuilder<DailyInfoSearchResult>();
  set searchResultList(ListBuilder<DailyInfoSearchResult> searchResultList) =>
      _$this._searchResultList = searchResultList;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  DateTime _currentDate;
  DateTime get currentDate => _$this._currentDate;
  set currentDate(DateTime currentDate) => _$this._currentDate = currentDate;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  SearchStateBuilder();

  SearchStateBuilder get _$this {
    if (_$v != null) {
      _searchResultList = _$v.searchResultList?.toBuilder();
      _error = _$v.error;
      _currentDate = _$v.currentDate;
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchState;
  }

  @override
  void update(void updates(SearchStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchState build() {
    _$SearchState _$result;
    try {
      _$result = _$v ??
          new _$SearchState._(
              searchResultList: searchResultList.build(),
              error: error,
              currentDate: currentDate,
              isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'searchResultList';
        searchResultList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
