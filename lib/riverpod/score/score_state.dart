import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/score_model.dart';

part 'score_state.freezed.dart';

@freezed
class ScoreState with _$ScoreState {
  const factory ScoreState({
    @Default(false) bool isLoading,
    @Default(false) bool showScoreHistory,
    @Default([]) List<ScoreModel> scoreList,
  }) = _ScoreState;

  const ScoreState._();
}