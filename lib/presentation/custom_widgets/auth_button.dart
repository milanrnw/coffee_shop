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
            Size(375.w, 48.h), // In Mediaquery it automatically takes full width and then can apply padding.
                              // How this works in flutterscreenutil as it fixes size 375 how will it run on wide device
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
