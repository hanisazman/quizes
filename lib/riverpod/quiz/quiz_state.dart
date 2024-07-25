import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/category_model.dart';
import '../../models/quiz_model.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool showQuestions,
    @Default('') String errorMsg,
    @Default([]) List<QuizModel> quizList,
    @Default([]) List<QuizModel> selectedQuizList,
    @Default(null) CategoryModel? selectedCategory,
    @Default(null) QuizModel? currentQuestion,
    @Default(0) int currentQuestionIndex,
    @Default('') String selectedOption,
    @Default({}) Map<int, String?> selectedAnswers,
    @Default(0) int score,
  }) = _QuizState;

  const QuizState._();
}