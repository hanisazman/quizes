import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/exports.dart';
import 'quiz_notifier.dart';
import 'quiz_state.dart';

final quizProvider =
    StateNotifierProvider.autoDispose<QuizNotifier, QuizState>(
  (ref) => QuizNotifier(quizRepository),
);
