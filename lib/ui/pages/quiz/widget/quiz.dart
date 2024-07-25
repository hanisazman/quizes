import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/ui/pages/quiz/widget/finish.dart';
import 'package:html_unescape/html_unescape.dart';


import '../../../../core/exports.dart';
import '../../../../riverpod/quiz/quiz_provider.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  var unescape = HtmlUnescape();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final quizState = ref.watch(quizProvider);
      final quizNotifier = ref.read(quizProvider.notifier);

      var currentQuestion = quizState.quizList.isNotEmpty
          ? quizState.quizList[quizState.currentQuestionIndex]
          : null;

      return quizState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${quizState.currentQuestionIndex + 1}/${quizState.quizList.length}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                  if (currentQuestion != null)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        surfaceTintColor: AppColors.primaryColor,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            unescape.convert(currentQuestion.question),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          (currentQuestion?.incorrectAnswers.length ?? 0) + 1,
                      itemBuilder: (context, index) {
                        if (currentQuestion == null) {
                          return const SizedBox(); // Handle null case
                        }

                        // Create a temporary list and shuffle it
                        final allOptions =
                            List.from(currentQuestion.incorrectAnswers);
                        allOptions.insert(0, currentQuestion.correctAnswer);

                        final option =
                            allOptions[index]; // Access shuffled options

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          surfaceTintColor: AppColors.primaryColor,
                          elevation: 5,
                          child: CheckboxListTile(
                            title: Text(unescape.convert(option)),
                            value: quizState.selectedAnswers[
                                    quizState.currentQuestionIndex] ==
                                option,
                            onChanged: (bool? value) {
                              if (value == true) {
                                quizNotifier.selectOption(option);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (quizState.currentQuestionIndex <
                            quizState.quizList.length - 1) {
                          quizNotifier.nextQuestion();
                        } else {
                          quizNotifier.calculateScore();

                          if (!mounted) return;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                backgroundColor: AppColors.mainBack,
                                children: [
                                  SizedBox(
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.88,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: QuizFinishPage(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.thirdColor,
                        foregroundColor: AppColors.black,
                      ),
                      child: Text(
                        quizState.currentQuestionIndex <
                                quizState.quizList.length - 1
                            ? 'Next question'
                            : 'Submit',
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
