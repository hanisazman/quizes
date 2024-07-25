import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/exports.dart';
import '../../../riverpod/score/score_provider.dart';
import '../../component/score_card.dart';

class ScoreHistoryPage extends ConsumerStatefulWidget {
  const ScoreHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScoreHistoryPageState();
}

class _ScoreHistoryPageState extends ConsumerState<ScoreHistoryPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(scoreProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.getScores();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(scoreProvider);
      final notifier = ref.read(scoreProvider.notifier);
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => notifier.setShowScoreHistory(false),
            child: Icon(
              FlutterRemix.arrow_left_s_line,
              size: 32.r,
            ),
          ),
          title: Text(
            "Score History",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
        body: ListView.builder(
          itemCount: state.scoreList.length,
          itemBuilder: (context, index) {
            final score = state.scoreList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ScoreCard(
                  name: score.name,
                  category: score.categories,
                  question: score.totalQuestion.toString(),
                  score: score.score.toString(),
                  date: score.date,
                  backgroundColor: AppColors.secondaryColor),
            );
          },
        ),
      );
    });
  }
}
