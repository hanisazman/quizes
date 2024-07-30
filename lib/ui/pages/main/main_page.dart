import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/exports.dart';
import '../../../riverpod/auth/auth_provider.dart';
import '../../../riverpod/quiz/quiz_provider.dart';
import '../../../riverpod/score/score_provider.dart';
import '../../component/drawer.dart';
import '../../component/topic_card.dart';
import '../quiz/questions_page.dart';
import '../../../models/category_model.dart';
import '../score/score_page.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  String name = '';

  void getLocalStorage() {
    setState(() {
      name = LocalStorage.instance.getName();
    });
  }

  @override
  void initState() {
    super.initState();
    getLocalStorage();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final quizNotifier = ref.read(quizProvider.notifier);
      final quizState = ref.watch(quizProvider);
      final scoreState = ref.watch(scoreProvider);
      final notifier = ref.read(authProvider.notifier);
      final scoreNotifier = ref.read(scoreProvider.notifier);
      return quizState.showQuestions
          ? const QuestionsPage()
          : scoreState.showScoreHistory
              ? const ScoreHistoryPage()
              : Scaffold(
                  backgroundColor: const Color(0xffFBFAFF),
                  drawer: AppDrawer(
                    onScoreHistory: () =>
                        scoreNotifier.setShowScoreHistory(true),
                    onLogout: () => notifier.logout(
                      goToLogin: () => context.replaceRoute(const LoginRoute()),
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    leading: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: AppColors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        );
                      },
                    ),
                  ),
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                      ),
                      Column(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Hi, ${name.toUpperCase()}!',
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
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                15.verticalSpace,
                                // Create a list of TopicCard widgets
                                ...categories
                                    .map((category) => TopicCard(
                                          title: category.name,
                                          subtitle: "5 Questions | 3 Minutes",
                                          buttonText: 'Continue',
                                          imagePath: category.image,
                                          onPressed: () {
                                            quizNotifier
                                                .setSelectedCategory(category);
                                            quizNotifier
                                                .selectShowQuestion(true);
                                          },
                                        ))
                                    .toList(),
                              ],
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                );
    });
  }
}
