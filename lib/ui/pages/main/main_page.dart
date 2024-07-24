import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/exports.dart';
import '../../../riverpod/auth/auth_provider.dart';
import '../../../riverpod/quiz/quiz_provider.dart';
import '../../component/topic_card.dart';
import '../quiz/question_page.dart';
import '../root.dart';
import '../../../models/category_model.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(authProvider.notifier);
    final quizNotifier = ref.read(quizProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.setUsernames();
      quizNotifier.fetchQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(authProvider);
      final quizState = ref.watch(quizProvider);
      final quizNotifier = ref.read(quizProvider.notifier);
      return RootApp(
          body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hi, ${state.name.toUpperCase()}!',
                    style: GoogleFonts.bayon(
                        color: AppColors.white, fontSize: 30.sp)),
                10.verticalSpace,
                Text('What would like to improve today?',
                    style: GoogleFonts.inter(
                        color: AppColors.white, fontSize: 16.sp))
              ],
            ),
          ),
          15.verticalSpace,
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final category = categories[index];
              return TopicCard(
                title: category.name,
                subtitle: "5 Questions | 3 Minutes",
                buttonText: 'Continue',
                imagePath: category.image,
                onPressed: () {
                  quizNotifier.setSelectedCategory(
                    category: category,
                    selectedQuiz: quizState.quizList
                        .where((q) => q.category == category.name)
                        .toList(),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionPage()),
                  );
                },
              );
            },
          ),
        ]),
      ));
    });
  }
}
