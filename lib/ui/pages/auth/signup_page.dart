import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/exports.dart';
import '../../../riverpod/auth/auth_provider.dart';
import '../../component/custom_textfield.dart';
import 'login_page.dart';
// import '../riverpod/login_provider.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      FlutterRemix.arrow_left_s_line,
                      size: 40.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "Sign Up",
                    style: GoogleFonts.bayon(
                        color: AppColors.secondaryColor, fontSize: 48),
                  ),
                ],
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                label: "Enter Username",
                controller: usernameController,
                errorText: state.signupError,
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                label: "Enter Name",
                controller: nameController,
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                label: "Enter Email",
                controller: emailController,
                errorText: state.emailError,
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                label: "Enter Password",
                controller: passwordController,
                isObscureText: state.showPassword,
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
                errorText: state.password,
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                label: "Enter Confirm Password",
                controller: confirmPasswordController,
                isObscureText: state.showConfirmPassword,
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
                errorText: state.confirmPasswordError,
              ),
              20.verticalSpace,
              Flexible(
                flex: 10,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.thirdColor),
                  child: MaterialButton(
                    onPressed: () => notifier.signup(
                      username: usernameController.text.trim(),
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      confirmPassword: confirmPasswordController.text.trim(),
                      goToLogin: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
