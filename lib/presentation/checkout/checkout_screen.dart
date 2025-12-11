import 'package:coffee_shop/constants/app_strings.dart';
import 'package:coffee_shop/model/transaction_model.dart';
import 'package:coffee_shop/model/voucher_model.dart';
import 'package:coffee_shop/presentation/checkout/checkout_detail.dart';
import 'package:coffee_shop/presentation/checkout/checkout_bottombar.dart';
import 'package:coffee_shop/presentation/transaction/order_receipt_screen.dart';
import 'package:coffee_shop/presentation/transaction/transaction_loading_screen.dart';
import 'package:coffee_shop/presentation/transaction/transaction_successful_screen.dart';
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
  final double _unitPrice = 25000;
  VoucherModel? _selectedVoucher;
  OrderType _selectedOrderType = OrderType.asap;
  String _scheduledTime = "Schedule Pick Up";
  String _paymentMethod = "GoPay (Rp 85.000)";

  void _updateQuantity(int newQuantity) {
    if (newQuantity < 1) return;
    setState(() {
      _quantity = newQuantity;
    });
  }

  void _onVoucherSelected(VoucherModel? voucher) {
    setState(() {
      _selectedVoucher = voucher;
    });
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = _unitPrice * _quantity;
    double discountAmount = 0;

    if (_selectedVoucher != null) {
      if (_selectedVoucher!.isPercentage) {
        discountAmount = subtotal * (_selectedVoucher!.discountAmount / 100);
      } else {
        discountAmount = _selectedVoucher!.discountAmount;
      }
      if (discountAmount > subtotal) {
        discountAmount = subtotal;
      }
    }

    double finalTotal = subtotal - discountAmount;

    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: const Color(0XFFFEFEFE),
        centerTitle: false,
        leading: IconButton(
            iconSize: 24.sp,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.checkoutTitle,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
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
              quantity: _quantity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded,
                        size: 14.sp, color: const Color(0xFF5D4037)),
                    SizedBox(width: 6.w),
                    Text(
                      "Add Order",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF5D4037),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 4.h,
              color: const Color(0xFFF4F4F4),
            ),
            SizedBox(height: 16.h),
            CheckoutDetail(
              selectedVoucher: _selectedVoucher,
              onVoucherSelected: _onVoucherSelected,
              subtotal: subtotal,
              discountAmount: discountAmount,
              total: finalTotal,
              quantity: _quantity,
              paymentMethod: _paymentMethod,
              orderType: _selectedOrderType,
              scheduledTime: _scheduledTime,
              onPaymentMethodChanged: (value) {
                setState(() {
                  _paymentMethod = value;
                });
              },
              onOrderTypeChanged: (value) {
                setState(() {
                  _selectedOrderType = value;
                });
              },
              onScheduledTimeChanged: (value) {
                setState(() {
                  _scheduledTime = value;
                });
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        totalPrice: "Rp. ${finalTotal.toStringAsFixed(0)}",
        onCheckoutPressed: () {
          final transactionData = TransactionModel(
            transactionId: "TRX${DateTime.now().millisecondsSinceEpoch}",
            date: "11 Dec 2025",
            time: "05:30 PM",
            productName:
                "Coffee Milk", // Needs to be dynamic, but not passed to CheckoutScreen yet
            productOptions: "Ice, Regular, Normal Sugar, Normal Ice",
            quantity: _quantity,
            price: _unitPrice,
            voucher: discountAmount,
            total: finalTotal,
            paymentMethod: _paymentMethod,
            schedulePickUpTime:
                _selectedOrderType == OrderType.asap ? "ASAP" : _scheduledTime,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransactionLoadingScreen(
                    nextScreen: TransactionSuccessfulScreen(
                        nextScreen:
                            OrderReceiptScreen(data: transactionData)))),
          );
        },
      ),
    );
  }
}
