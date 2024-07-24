import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/exports.dart';
import '../../../riverpod/quiz/quiz_provider.dart';

class QuestionPage extends ConsumerStatefulWidget {
  const QuestionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends ConsumerState<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final quizState = ref.watch(quizProvider);
      final quizNotifier = ref.read(quizProvider.notifier);

      final currentQuestion = quizState.selectedQuizList.isNotEmpty
          ? quizState.selectedQuizList[quizState.currentQuestionIndex]
          : null;

      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${quizState.currentQuestionIndex + 1}/${quizState.selectedQuizList.length}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: AppColors.white,
                ),
              ),
              if (currentQuestion != null)
                Text(
                  currentQuestion.question,
                  style: TextStyle(fontSize: 20),
                ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: currentQuestion?.incorrectAnswers.length ?? 0,
                  itemBuilder: (context, index) {
                    final option = index == 0
                        ? currentQuestion?.correctAnswer
                        : currentQuestion?.incorrectAnswers[index - 1];
                    return CheckboxListTile(
                      title: Text(option ?? ''),
                      value: quizState.selectedOptionIndex == index,
                      onChanged: (bool? value) {
                        quizNotifier.selectOption(index);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    quizNotifier.nextQuestion();
                  },
                  child: Text('Next question'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.thirdColor,
                    foregroundColor: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
