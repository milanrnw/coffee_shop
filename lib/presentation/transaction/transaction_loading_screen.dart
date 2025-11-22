import 'package:flutter/material.dart';

class TransactionLoadingScreen extends StatefulWidget {
  const TransactionLoadingScreen({
    super.key,
    required this.nextScreen,
  });

  final Widget nextScreen;

  @override
  State<TransactionLoadingScreen> createState() => _TransactionLoadingScreen();
}

class _TransactionLoadingScreen extends State<TransactionLoadingScreen> {
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
              'assets/gif/coffee_loading.gif',
              scale: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
