import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/exports.dart';
import '../../../riverpod/auth/auth_provider.dart';
import '../../component/custom_textfield.dart';
import '../../component/error_alert_dialog.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Lottie.asset(
                  "assets/lottie/quiz_animation.json",
                  height: 250.h,
                ),
                Text(
                  "QUIZES",
                  style: GoogleFonts.bayon(
                    color: AppColors.secondaryColor,
                    fontSize: 48,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  label: "Enter Username",
                  controller: usernameController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  label: "Enter Password",
                  controller: passwordController,
                  isObscureText: !state.showPassword,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    splashRadius: 25.r,
                    icon: Icon(
                      state.showPassword
                          ? FlutterRemix.eye_line
                          : FlutterRemix.eye_close_line,
                      color: AppColors.black,
                      size: 20.r,
                    ),
                    onPressed: () =>
                        notifier.setShowPassword(!state.showPassword),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      notifier.login(
                        username: usernameController.text.trim(),
                        password: passwordController.text.trim(),
                        onFail: () => showDialog(
                            context: context,
                            builder: (ctx) =>
                                Consumer(builder: (context, ref, _) {
                                  final state = ref.watch(authProvider);
                                  return ErrorAlertDialogWidget(
                                      errorMsg: state.loginError);
                                })),
                        goToMain: () => context.replaceRoute(const MainRoute()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 30,
                  thickness: 1,
                  color: AppColors.secondaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushRoute(const SignUpRoute());
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.inter(
                          color: AppColors.thirdColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
