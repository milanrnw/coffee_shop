import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/authentication/privacy_polcy.dart';
import 'package:coffee_shop/presentation/authentication/terms_of_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: AppStrings.registerTermsAndPrivacyText1,
              style: AppTextStyles.registerTermsAndPrivacyText1,
            ),
            TextSpan(
              text: AppStrings.registerTermsAndPrivacyText2,
              style:  AppTextStyles.registerTermsAndPrivacyText2,
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsOfService(),
                      ),
                    ),
            ),
            TextSpan(
              text: AppStrings.registerTermsAndPrivacyText3,
              style: AppTextStyles.registerTermsAndPrivacyText3,
            ),
            TextSpan(
              text: AppStrings.registerTermsAndPrivacyText4,
              style: AppTextStyles.registerTermsAndPrivacyText4,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
