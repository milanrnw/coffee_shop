import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTextfield extends StatelessWidget {
  const OtpTextfield({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      animationType: AnimationType.fade,
      textInputAction: TextInputAction.done,
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 4),
        inActiveBoxShadow: [
          BoxShadow(
            blurRadius: 4,
            blurStyle: BlurStyle.outer,
            offset: Offset.zero,
            spreadRadius: 0,
            color: Color(0XFF945927).withValues(alpha: 0.60),
          ),
        ],
        activeBoxShadow: [
          BoxShadow(
            blurRadius: 4,
            blurStyle: BlurStyle.outer,
            offset: Offset.zero,
            spreadRadius: 0,
            color: Color(0XFF945927).withValues(alpha: 0.60),
          ),
        ],
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 70,
        fieldWidth: 60,
        activeFillColor: Colors.transparent,
        inactiveFillColor: Colors.grey.shade300,
        inactiveColor: Colors.transparent,
        activeColor: Color(0XFF945927),
        selectedFillColor: Colors.transparent,
        selectedColor: Color(0XFF945927),
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      autoFocus: false,
      enableActiveFill: true,
      autoDismissKeyboard: true,
      textStyle: AppTextStyles.otpTextFieldText,
      cursorWidth: 3.w,
      cursorHeight: 36.h,
      cursorColor: Color(0XFF3C3C3C),
      keyboardType: TextInputType.number,
      controller: controller,
      appContext: context,
      length: 5,
    );
  }
}
