import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/exports.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.focusNode,
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.errorText,
    this.textInputAction,
  });

  final FocusNode? focusNode;
  final String label;
  final TextEditingController controller;
  final Widget? prefixIcon, suffixIcon;
  final bool? isObscureText;
  final String? errorText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObscureText!,
            obscuringCharacter: '*',
          textInputAction: textInputAction,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: AppColors.black,
              letterSpacing: -14 * 0.01,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              floatingLabelStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: AppColors.black,
                letterSpacing: -14 * 0.01,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
          if (errorText != '' && errorText != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.verticalSpace,
                Text(
                  errorText!,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                    fontSize: 12.sp,
                    color: AppColors.red,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
