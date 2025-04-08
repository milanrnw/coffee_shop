import 'package:flutter/material.dart';

class ShopFeeIcon extends StatelessWidget {
  const ShopFeeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Image.asset(
        'assets/images/register_logo.png',
        width: screenWidth * 0.584,
        height: screenHeight * 0.123,
        alignment: Alignment.center,
      ),
    );
  }
}
