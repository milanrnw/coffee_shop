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
            const TextSpan(
              text: 'By tapping "Register" you agree to our\n',
              style: TextStyle(fontSize: 12, color: Color(0XFF7C7C7C)),
            ),
            TextSpan(
              text: 'Terms of Use',
              style: const TextStyle(fontSize: 12, color: Color(0XFF032172)),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsOfService(),
                      ),
                    ),
            ),
            const TextSpan(
              text: ' and ',
              style: TextStyle(fontSize: 12, color: Color(0XFF7C7C7C)),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(fontSize: 12, color: Color(0XFF032172)),
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
