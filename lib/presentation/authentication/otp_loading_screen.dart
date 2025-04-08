import 'package:flutter/material.dart';

class OtpLoadingScreen extends StatefulWidget {
  const OtpLoadingScreen({
    super.key,
    required this.nextScreen,
  });

  final Widget nextScreen;

  @override
  State<OtpLoadingScreen> createState() => _OtpLoadingScreenState();
}

class _OtpLoadingScreenState extends State<OtpLoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coffee_loading.gif',
              scale: 0.5,
            ),
            const SizedBox(height: 8),
            const Text(
              'Please wait a minute',
              style: TextStyle(
                fontSize: 14,
                color: Color(0XFF3C3C3C),
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'We will send you the otp code',
              style: TextStyle(
                fontSize: 14,
                color: Color(0XFF3C3C3C),
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
