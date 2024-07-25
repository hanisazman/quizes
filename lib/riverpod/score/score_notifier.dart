import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../../core/exports.dart';

import '../../models/score_model.dart';
import 'score_state.dart';

class ScoreNotifier extends StateNotifier<ScoreState> {
  final logger = Logger();
  final HiveService hiveService = HiveService();

  final Box<ScoreModel> _scoreBox;

  ScoreNotifier()
      : _scoreBox = Hive.box<ScoreModel>('scoreBox'),
        super(const ScoreState());

  setShowScoreHistory(bool val){
    state = state.copyWith(showScoreHistory: val);
  }

  void addScore({
    required String categoryName,
    required int score,
    required int totalQuestion,
  }) async {
    state = state.copyWith(isLoading: true);

    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';

    final newId = (_scoreBox.length + 1); // Generate incremental ID
    final newScore = ScoreModel(
        id: newId,
        name: name,
        categories: categoryName,
        score: score,
        date: DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()),
        totalCorrectAnswer: score,
        totalQuestion: totalQuestion);

    await _scoreBox.put(newId, newScore);
  }

  getScores() {
    state = state.copyWith(isLoading: true, scoreList: _scoreBox.values.toList());
  }
}
