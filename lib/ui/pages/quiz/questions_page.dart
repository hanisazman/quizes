import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/exports.dart';
import '../../../riverpod/quiz/quiz_provider.dart';
import 'widget/quiz.dart';

class QuestionsPage extends ConsumerStatefulWidget {
  const QuestionsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(quizProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.fetchQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final quizState = ref.watch(quizProvider);
      final quizNotifier = ref.read(quizProvider.notifier);

      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => quizNotifier.selectShowQuestion(false),
            child: Icon(
              FlutterRemix.arrow_left_s_line,
              size: 32.r,
            ),
          ),
          title: Text(
            quizState.selectedCategory?.name ?? '',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
        body: const QuizPage(),
      );
    });
  }
}
