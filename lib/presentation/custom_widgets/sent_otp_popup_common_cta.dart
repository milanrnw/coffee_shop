import 'package:flutter/material.dart';

class SentOtpPopupCommonCta extends StatelessWidget {
  const SentOtpPopupCommonCta({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.buttonBackground,
    this.buttonTextColor,
    });

  final String buttonText;
  final Color? buttonBackground;
  final Color? buttonTextColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap (),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: buttonBackground ?? const Color(0XFF5D4037),
          border: Border.all(
            color: Color(0XFF5D4037),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 14,
            color: buttonTextColor ?? const Color(0XFFFEFEFE),
          ),
        ),
      ),
    );
  }
}
