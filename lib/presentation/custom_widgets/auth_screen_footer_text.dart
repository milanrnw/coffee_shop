import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreenFooterText extends StatelessWidget {
  const AuthScreenFooterText({
    super.key,
    required this.initialText,
    required this.linkText,
    required this.onTapLink,
    this.linkTextColor,
    this.initialTextColor,
  });

  final String initialText;
  final String linkText;
  final Function onTapLink;
  final Color? linkTextColor;
  final Color? initialTextColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: initialText,
              style: TextStyle(
                fontSize: 14.sp,
                color: initialTextColor ?? const Color(0XFF555555), //how to use flutterscreenutil
              ),
            ),
            TextSpan(
              text: linkText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: linkTextColor ?? const Color(0XFF5D4037),
              ),
              recognizer: TapGestureRecognizer()..onTap = () => onTapLink(),
            ),
          ],
        ),
      ),
    );
  }
}
