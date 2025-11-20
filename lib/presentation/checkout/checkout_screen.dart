import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/model/voucher_model.dart';
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
  final double _unitPrice = 25000; // Base price per item
  VoucherModel? _selectedVoucher;

  void _updateQuantity(int newQuantity) {
    if (newQuantity < 1) return;
    setState(() {
      _quantity = newQuantity;
    });
  }

  // Handler to update voucher state from child
  void _onVoucherSelected(VoucherModel? voucher) {
    setState(() {
      _selectedVoucher = voucher;
    });
  }

  @override
  Widget build(BuildContext context) {
    // --- CALCULATIONS ---
    double subtotal = _unitPrice * _quantity;
    double discountAmount = 0;

    // Logic to calculate discount based on your model properties
    if (_selectedVoucher != null) {
      if (_selectedVoucher!.isPercentage) {
        discountAmount = subtotal * (_selectedVoucher!.discountAmount / 100);
      } else {
        discountAmount = _selectedVoucher!.discountAmount;
      }
      // Cap discount at subtotal
      if (discountAmount > subtotal) discountAmount = subtotal;
    }

    double finalTotal = subtotal - discountAmount;
    // ---------------------

    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: const Color(0XFFFEFEFE),
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
              quantity: _quantity, // Ensure OrderCard accepts this
            ),
            Divider(
              thickness: 4.h,
              color: const Color(0xFFF4F4F4),
            ),
            SizedBox(height: 16.h),

            // PASSING DATA DOWN
            CheckoutDetail(
              selectedVoucher: _selectedVoucher,
              onVoucherSelected: _onVoucherSelected,
              subtotal: subtotal,
              discountAmount: discountAmount,
              total: finalTotal,
              quantity: _quantity,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        // Passing formatted total string
        totalPrice: "Rp. ${finalTotal.toStringAsFixed(0)}",
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
