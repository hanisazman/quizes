// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  List<QuizModel> get quizList => throw _privateConstructorUsedError;
  List<QuizModel> get selectedQuizList => throw _privateConstructorUsedError;
  CategoryModel? get selectedCategory => throw _privateConstructorUsedError;
  int get selectedOptionIndex => throw _privateConstructorUsedError;
  QuizModel? get currentQuestion => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizStateCopyWith<QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMsg,
      List<QuizModel> quizList,
      List<QuizModel> selectedQuizList,
      CategoryModel? selectedCategory,
      int selectedOptionIndex,
      QuizModel? currentQuestion,
      int currentQuestionIndex});
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMsg = null,
    Object? quizList = null,
    Object? selectedQuizList = null,
    Object? selectedCategory = freezed,
    Object? selectedOptionIndex = null,
    Object? currentQuestion = freezed,
    Object? currentQuestionIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      selectedQuizList: null == selectedQuizList
          ? _value.selectedQuizList
          : selectedQuizList // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      selectedOptionIndex: null == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuestion: freezed == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as QuizModel?,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizStateImplCopyWith<$Res>
    implements $QuizStateCopyWith<$Res> {
  factory _$$QuizStateImplCopyWith(
          _$QuizStateImpl value, $Res Function(_$QuizStateImpl) then) =
      __$$QuizStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMsg,
      List<QuizModel> quizList,
      List<QuizModel> selectedQuizList,
      CategoryModel? selectedCategory,
      int selectedOptionIndex,
      QuizModel? currentQuestion,
      int currentQuestionIndex});
}

/// @nodoc
class __$$QuizStateImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizStateImpl>
    implements _$$QuizStateImplCopyWith<$Res> {
  __$$QuizStateImplCopyWithImpl(
      _$QuizStateImpl _value, $Res Function(_$QuizStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMsg = null,
    Object? quizList = null,
    Object? selectedQuizList = null,
    Object? selectedCategory = freezed,
    Object? selectedOptionIndex = null,
    Object? currentQuestion = freezed,
    Object? currentQuestionIndex = null,
  }) {
    return _then(_$QuizStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      selectedQuizList: null == selectedQuizList
          ? _value._selectedQuizList
          : selectedQuizList // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      selectedOptionIndex: null == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuestion: freezed == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as QuizModel?,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QuizStateImpl extends _QuizState {
  const _$QuizStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.errorMsg = '',
      final List<QuizModel> quizList = const [],
      final List<QuizModel> selectedQuizList = const [],
      this.selectedCategory = null,
      this.selectedOptionIndex = 0,
      this.currentQuestion = null,
      this.currentQuestionIndex = 0})
      : _quizList = quizList,
        _selectedQuizList = selectedQuizList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String errorMsg;
  final List<QuizModel> _quizList;
  @override
  @JsonKey()
  List<QuizModel> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  final List<QuizModel> _selectedQuizList;
  @override
  @JsonKey()
  List<QuizModel> get selectedQuizList {
    if (_selectedQuizList is EqualUnmodifiableListView)
      return _selectedQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedQuizList);
  }

  @override
  @JsonKey()
  final CategoryModel? selectedCategory;
  @override
  @JsonKey()
  final int selectedOptionIndex;
  @override
  @JsonKey()
  final QuizModel? currentQuestion;
  @override
  @JsonKey()
  final int currentQuestionIndex;

  @override
  String toString() {
    return 'QuizState(isLoading: $isLoading, isError: $isError, errorMsg: $errorMsg, quizList: $quizList, selectedQuizList: $selectedQuizList, selectedCategory: $selectedCategory, selectedOptionIndex: $selectedOptionIndex, currentQuestion: $currentQuestion, currentQuestionIndex: $currentQuestionIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            const DeepCollectionEquality()
                .equals(other._selectedQuizList, _selectedQuizList) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            (identical(other.currentQuestion, currentQuestion) ||
                other.currentQuestion == currentQuestion) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isError,
      errorMsg,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_selectedQuizList),
      selectedCategory,
      selectedOptionIndex,
      currentQuestion,
      currentQuestionIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStateImplCopyWith<_$QuizStateImpl> get copyWith =>
      __$$QuizStateImplCopyWithImpl<_$QuizStateImpl>(this, _$identity);
}

abstract class _QuizState extends QuizState {
  const factory _QuizState(
      {final bool isLoading,
      final bool isError,
      final String errorMsg,
      final List<QuizModel> quizList,
      final List<QuizModel> selectedQuizList,
      final CategoryModel? selectedCategory,
      final int selectedOptionIndex,
      final QuizModel? currentQuestion,
      final int currentQuestionIndex}) = _$QuizStateImpl;
  const _QuizState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorMsg;
  @override
  List<QuizModel> get quizList;
  @override
  List<QuizModel> get selectedQuizList;
  @override
  CategoryModel? get selectedCategory;
  @override
  int get selectedOptionIndex;
  @override
  QuizModel? get currentQuestion;
  @override
  int get currentQuestionIndex;
  @override
  @JsonKey(ignore: true)
  _$$QuizStateImplCopyWith<_$QuizStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
