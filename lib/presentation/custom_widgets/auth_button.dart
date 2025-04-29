import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(
            Size(335.w, 48.h), //Mediaquery let us use max width, but do flutterscreenutil?
          ),
          backgroundColor: const WidgetStatePropertyAll(
            Color(0XFFCACACA),
          ),
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
