import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'score_notifier.dart';
import 'score_state.dart';

final scoreProvider =
    StateNotifierProvider.autoDispose<ScoreNotifier, ScoreState>(
  (ref) => ScoreNotifier(),
);
