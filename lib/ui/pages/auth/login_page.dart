import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/exports.dart';
// import '../../../components/components.dart';
// import '../../../components/text_fields/custom_textformfield.dart';
import '../../../riverpod/auth/auth_provider.dart';
import '../../component/custom_textfield.dart';
import '../main/main_page.dart';
import 'signup_page.dart';
// import '../riverpod/login_provider.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(
                flex: 5,
              ),
              Expanded(
                flex: 50,
                child: Lottie.asset("assets/lottie/quiz_animation.json"),
              ),
              Expanded(
                flex: 15,
                child: Text(
                  "QUIZES",
                  style: GoogleFonts.bayon(
                      color: AppColors.secondaryColor, fontSize: 48),
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              CustomTextFieldWidget(
                  label: "Enter Username", controller: usernameController),
              const Spacer(
                flex: 5,
              ),
              CustomTextFieldWidget(
                  label: "Enter Password",
                  controller: passwordController,
                  isObscureText: !state.showPassword,
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
                  )),
              const Spacer(
                flex: 5,
              ),
              Flexible(
                flex: 10,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondaryColor),
                  child: MaterialButton(
                    onPressed: () async {
                      notifier.login(
                          username: usernameController.text.trim(),
                          password: passwordController.text.trim(),
                          goToMain: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()),
                              ));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                          fontSize: 20.sp, color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: AppColors.secondaryColor,
              ),
              Flexible(
                flex: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 18.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.inter(
                              color: AppColors.thirdColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
