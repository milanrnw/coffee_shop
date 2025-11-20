import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/checkout/checkout_detail.dart';
import 'package:coffee_shop/presentation/checkout/checkout_bottombar.dart';
import 'package:coffee_shop/presentation/transaction/transaction_success.dart';
import 'package:coffee_shop/product/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _quantity = 1;

  void _updateQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFEFE),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24.sp,
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.checkoutTitle,
          style: AppTextStyles.checkOutTitleBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 4.h,
              color: const Color(0xFFF4F4F4),
            ),
            OrderCard(
              onQuantityChanged: _updateQuantity,
            ),
            Divider(
              thickness: 4.h,
              color: const Color(0xFFF4F4F4),
            ),
            SizedBox(height: 16.h),
            CheckoutDetail(),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        onCheckoutPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionSuccess()),
          );
        },
      ),
    );
  }
}
