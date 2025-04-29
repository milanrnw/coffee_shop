import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    required this.labelName,
    this.textInputAction,
    this.textInputType,
    this.hintText,
  });

  final String labelName;
  final TextEditingController controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelName,
          style: AppTextStyles.loginLabel,
        ),
        SizedBox(height: 4.h),

        TextField(
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          cursorColor: Color(0XFF8A8A8A),
          cursorHeight: 16.h,
          cursorErrorColor: Colors.red,
          style: AppTextStyles.commonTextFieldText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFF5D4037),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.loginNumberHint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFF8A8A8A),
              ),
              borderRadius: BorderRadius.circular(16.r),
            )
          ),
        )
      ],
    );
  }
}
