import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('seenOnboarding', true);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: Text(
            'Skip',
            style: AppTextStyles.skipButton,
          ),
        ),
      ],
    );
  }
}
