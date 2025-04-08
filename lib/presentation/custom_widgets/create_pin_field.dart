import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreatePinField extends StatelessWidget {
  const CreatePinField({super.key, required this.createPinController});

  final TextEditingController createPinController;

  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;

    return PinCodeTextField(
      backgroundColor: Colors.amber,
      obscureText: true,
      animationType: AnimationType.fade,
      textInputAction: TextInputAction.done,
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.only(right: 20),
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
        activeFillColor: Color(0XFF3C3C3C),
        inactiveFillColor: Colors.transparent,
        inactiveColor: Color(0XFF868686),
        activeColor: Color(0XFF868686),
        selectedFillColor: Colors.transparent,
        selectedColor: Color(0XFF868686),
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      autoFocus: false,
      enableActiveFill: true,
      autoDismissKeyboard: true,
      textStyle: TextStyle(
        fontSize: 24,
        color: Color(0XFF555555),
      ),
      showCursor: false,
      keyboardType: TextInputType.number,
      controller: createPinController,
      appContext: context,
      length: 6,
    );
  }
}
