import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/exports.dart';
import '../../../../riverpod/quiz/quiz_provider.dart';
import '../../../../riverpod/score/score_provider.dart';

class QuizFinishPage extends ConsumerStatefulWidget {
  const QuizFinishPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends ConsumerState<QuizFinishPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scoreNotifier = ref.read(scoreProvider.notifier);
    final quizState = ref.watch(quizProvider);
    final quizNotifier = ref.read(quizProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scoreNotifier.addScore(
          categoryName: quizState.selectedCategory!.name,
          score: quizState.score,
          totalQuestion: quizState.quizList.length);
      quizNotifier.selectShowQuestion(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final quizState = ref.watch(quizProvider);
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset("assets/lottie/finish.json"),
                10.verticalSpace,
                Text(
                    'Congratulation! You have successfully finish answering the quiz.',
                    style: GoogleFonts.inter(fontSize: 16.sp)),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your Score: ',
                        style: GoogleFonts.inter(
                            fontSize: 26.sp, fontWeight: FontWeight.w400)),
                    Text(quizState.score.toString(),
                        style: GoogleFonts.inter(
                            color: AppColors.secondaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                15.verticalSpace,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.thirdColor,
                      foregroundColor: AppColors.black,
                    ),
                    child: Text(
                      'Great!',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
              ]),
        ),
      );
    });
  }
}
