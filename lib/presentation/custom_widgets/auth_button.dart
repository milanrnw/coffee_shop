import 'package:flutter/material.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(
            Size(screenWidth, 48),
          ),
          backgroundColor: const WidgetStatePropertyAll(
            Color(0XFFCACACA),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        onPressed: () => onTap(),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Color(0XFFFFFFFF),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
