import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/home/home_screen.dart';
import 'package:coffee_shop/presentation/transaction/transaction_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderReceiptScreen extends StatefulWidget {
  const OrderReceiptScreen({super.key});

  @override
  State<OrderReceiptScreen> createState() => _OrderReceiptScreenState();
}

class _OrderReceiptScreenState extends State<OrderReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0XFFFEFEFE),
        appBar: AppBar(
          backgroundColor: const Color(0XFFFEFEFE),
          leadingWidth: 40,
          centerTitle: false,
          leading: IconButton(
            iconSize: 24.sp,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false,
              );
            },
          ),
          title: Text(
            "Receipt Order",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              thickness: 4.h,
              color: const Color(0xFFF4F4F4),
            ),
            SizedBox(height: 20.h),
            TransactionDetailCard(
                transactionId: "D123456789ABC",
                date: "10 July’22",
                time: "04:13 PM",
                productName: "Coffee Milk",
                productOptions: "Ice, Regular, Normal Sugar, Normal Ice",
                quantity: 1,
                price: 25.000,
                voucher: 0,
                total: 25.000,
                paymentMethod: "Gopay",
                schedulePickUpTime: "05.15 PM"),
            SizedBox(
              height: 32.h,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandColor,
                minimumSize: Size(159.w, 48.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                "Tracking Order",
                style: AppTextStyles.authButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
