import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreatePinField extends StatelessWidget {
  const CreatePinField({
    super.key,
    required this.createPinController,
    required this.obscureText,
    this.onChanged,
  });

  final TextEditingController createPinController;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      onChanged: onChanged ?? (value) {},
      obscureText: obscureText,
      animationType: AnimationType.fade,
      textInputAction: TextInputAction.done,
      pinTheme: PinTheme(
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
        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 36,
        fieldWidth: 30,
        activeFillColor:
            obscureText ? const Color(0XFF3C3C3C) : Colors.transparent,
        inactiveFillColor: Colors.transparent,
        inactiveColor: const Color(0XFF868686),
        activeColor: const Color(0XFF868686),
        selectedFillColor: Colors.transparent,
        selectedColor: const Color(0XFF868686),
      ),
      autoFocus: false,
      autoDisposeControllers: false,
      enableActiveFill: true,
      autoDismissKeyboard: true,
      textStyle: obscureText
          ? AppTextStyles.createPinFieldText.copyWith(color: Colors.transparent)
          : AppTextStyles.createPinFieldText,
      showCursor: false,
      keyboardType: TextInputType.number,
      controller: createPinController,
      appContext: context,
      length: 6,
    );
  }
}
