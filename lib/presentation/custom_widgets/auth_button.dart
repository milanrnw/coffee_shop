import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.buttonColor});

  final String buttonText;
  final Function onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(
            Size(375.w, 48.h),
          ),
          backgroundColor:
              WidgetStatePropertyAll(buttonColor ?? const Color(0XFFCACACA)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        onPressed: () => onTap(),
        child: Text(
          buttonText,
          style: AppTextStyles.authButton,
        ),
      ),
    );
  }
}
