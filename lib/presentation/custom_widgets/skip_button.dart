import 'package:coffee_shop/presentation/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: Text(
            'Skip',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Color(0XFF3C3C3C),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
