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

  setSelectedCategory(
      {required CategoryModel category,
      required List<QuizModel> selectedQuiz}) {
    state = state.copyWith(
        selectedCategory: category, selectedQuizList: selectedQuiz);
    logger.i(state.selectedQuizList);
  }

  void selectOption(int index) {
    state = state.copyWith(selectedOptionIndex: index);
  }

  void nextQuestion() {
    final currentIndex =
        state.selectedQuizList.indexWhere((q) => q == state.currentQuestion);
    if (currentIndex < state.selectedQuizList.length - 1) {
      final nextQuestion = state.selectedQuizList[currentIndex + 1];
      state = state.copyWith(
        currentQuestion: nextQuestion,
        currentQuestionIndex: currentIndex + 1,
      );
    } else {
      // Handle end of quiz
    }
  }

  Future<void> fetchQuiz({bool? isRefresh}) async {
  if (!mounted) return;

  state = state.copyWith(isLoading: true);

  try {
    List<QuizModel> combinedQuizList = [];

    for (var category in categories) {
      final key = 'category_${category.id}';
      List<QuizModel> categoryQuizList = [];

      if (_quizBox.get(key) == null || isRefresh == true) {
        final response = await _quizRepository.getQuizes(category.id);

        // Handle the API response
        await response.when(
          success: (data) async {
            logger.d('Fetched data: $data');
            await hiveService.putAllWithCategoryKey(
              key,
              data,
              _quizBox,
            );
            categoryQuizList = data; // Update with fetched data
          },
          failure: (failure) {
            logger.e('API call failure: $failure');
            state = state.copyWith(isLoading: false);
            return; // Exit the loop on failure
          },
        );
      } else {
        categoryQuizList = (_quizBox.get(key) as List).cast<QuizModel>();
        logger.d('Loaded data from Hive: $categoryQuizList');
      }

      combinedQuizList.addAll(categoryQuizList); // Combine quiz lists
    }

    state = state.copyWith(isLoading: false, quizList: combinedQuizList); // Update state
  } catch (e) {
    state = state.copyWith(isLoading: false);
    logger.e('An unexpected error occurred: $e');
  } finally {
    if (mounted) {
      logger.d('Final quiz list: ${state.quizList}');
    }
  }
}

}
