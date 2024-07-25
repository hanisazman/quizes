import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/exports.dart';

import '../../models/quiz_model.dart';
import '../../models/category_model.dart';
import '../../repository/quiz_repository.dart';
import 'quiz_state.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  final logger = Logger();
  final QuizRepository _quizRepository;
  final HiveService hiveService = HiveService();

  final Box<QuizModel> _quizBox;

  QuizNotifier(this._quizRepository)
      : _quizBox = Hive.box<QuizModel>('quizBox'),
        super(const QuizState());

  void selectShowQuestion(bool value) {
    state = state.copyWith(showQuestions: value);
  }

  void setSelectedCategory(CategoryModel category) {
    state = state.copyWith(selectedCategory: category);
  }

  setInitialAnswers() {
    state = state.copyWith(selectedAnswers: {
      for (var index in Iterable<int>.generate(state.quizList.length))
        index: null
    });
    logger.i(state.selectedAnswers);
  }

  void selectOption(String option) {
    final currentIndex = state.currentQuestionIndex;

    final updatedSelectedAnswers =
        Map<int, String?>.from(state.selectedAnswers);
    updatedSelectedAnswers[currentIndex] = option;

    state = state.copyWith(
      selectedOption: option,
      selectedAnswers: updatedSelectedAnswers,
    );
  }

  void nextQuestion() {
    final currentIndex = state.currentQuestionIndex;
    if (currentIndex < state.quizList.length - 1) {
      final nextQuestion = state.quizList[currentIndex + 1];
      state = state.copyWith(
        currentQuestion: nextQuestion,
        currentQuestionIndex: currentIndex + 1,
        selectedOption: '', // Clear selected option for next question
      );
    }
  }

  void calculateScore() {
    int score = 0;
    for (int i = 0; i < state.quizList.length; i++) {
      final selectedAnswer = state.selectedAnswers[i];
      if (selectedAnswer != null && selectedAnswer.isNotEmpty) {
        final currentQuestion = state.quizList[i];
        final correctAnswer = currentQuestion.correctAnswer;
        if (correctAnswer == selectedAnswer) {
          score++;
        }
      }
    }
    state = state.copyWith(score: score);
    // logger.i("score: $score");
  }

  Future<void> fetchQuiz({bool? isRefresh}) async {
    try {
      state = state.copyWith(isLoading: true);
      if (_quizBox.isEmpty ||
          !_quizBox.values
              .any((q) => q.category == state.selectedCategory?.name)) {
        final response =
            await _quizRepository.getQuizes(state.selectedCategory?.id ?? 0);
        response.when(
          success: (data) {
            setInitialAnswers();
            state = state.copyWith(isLoading: false, quizList: data);
          },
          failure: (failure) {
            logger.e(failure);
          },
        );
        hiveService.assignAll(list: state.quizList, box: _quizBox);
      } else {
        setInitialAnswers();
        state = state.copyWith(
            isLoading: false, quizList: _quizBox.values.toList());
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}
