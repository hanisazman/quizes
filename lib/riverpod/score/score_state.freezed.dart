// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScoreState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showScoreHistory => throw _privateConstructorUsedError;
  List<ScoreModel> get scoreList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScoreStateCopyWith<ScoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreStateCopyWith<$Res> {
  factory $ScoreStateCopyWith(
          ScoreState value, $Res Function(ScoreState) then) =
      _$ScoreStateCopyWithImpl<$Res, ScoreState>;
  @useResult
  $Res call(
      {bool isLoading, bool showScoreHistory, List<ScoreModel> scoreList});
}

/// @nodoc
class _$ScoreStateCopyWithImpl<$Res, $Val extends ScoreState>
    implements $ScoreStateCopyWith<$Res> {
  _$ScoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? showScoreHistory = null,
    Object? scoreList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showScoreHistory: null == showScoreHistory
          ? _value.showScoreHistory
          : showScoreHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      scoreList: null == scoreList
          ? _value.scoreList
          : scoreList // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreStateImplCopyWith<$Res>
    implements $ScoreStateCopyWith<$Res> {
  factory _$$ScoreStateImplCopyWith(
          _$ScoreStateImpl value, $Res Function(_$ScoreStateImpl) then) =
      __$$ScoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool showScoreHistory, List<ScoreModel> scoreList});
}

/// @nodoc
class __$$ScoreStateImplCopyWithImpl<$Res>
    extends _$ScoreStateCopyWithImpl<$Res, _$ScoreStateImpl>
    implements _$$ScoreStateImplCopyWith<$Res> {
  __$$ScoreStateImplCopyWithImpl(
      _$ScoreStateImpl _value, $Res Function(_$ScoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? showScoreHistory = null,
    Object? scoreList = null,
  }) {
    return _then(_$ScoreStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showScoreHistory: null == showScoreHistory
          ? _value.showScoreHistory
          : showScoreHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      scoreList: null == scoreList
          ? _value._scoreList
          : scoreList // ignore: cast_nullable_to_non_nullable
              as List<ScoreModel>,
    ));
  }
}

/// @nodoc

class _$ScoreStateImpl extends _ScoreState {
  const _$ScoreStateImpl(
      {this.isLoading = false,
      this.showScoreHistory = false,
      final List<ScoreModel> scoreList = const []})
      : _scoreList = scoreList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool showScoreHistory;
  final List<ScoreModel> _scoreList;
  @override
  @JsonKey()
  List<ScoreModel> get scoreList {
    if (_scoreList is EqualUnmodifiableListView) return _scoreList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoreList);
  }

  @override
  String toString() {
    return 'ScoreState(isLoading: $isLoading, showScoreHistory: $showScoreHistory, scoreList: $scoreList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.showScoreHistory, showScoreHistory) ||
                other.showScoreHistory == showScoreHistory) &&
            const DeepCollectionEquality()
                .equals(other._scoreList, _scoreList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, showScoreHistory,
      const DeepCollectionEquality().hash(_scoreList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreStateImplCopyWith<_$ScoreStateImpl> get copyWith =>
      __$$ScoreStateImplCopyWithImpl<_$ScoreStateImpl>(this, _$identity);
}

abstract class _ScoreState extends ScoreState {
  const factory _ScoreState(
      {final bool isLoading,
      final bool showScoreHistory,
      final List<ScoreModel> scoreList}) = _$ScoreStateImpl;
  const _ScoreState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get showScoreHistory;
  @override
  List<ScoreModel> get scoreList;
  @override
  @JsonKey(ignore: true)
  _$$ScoreStateImplCopyWith<_$ScoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
