import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetailCard extends StatelessWidget {
  final String transactionId;
  final String date;
  final String time;
  final String productName;
  final String productOptions;
  final int quantity;
  final double price;
  final double voucher;
  final double total;
  final String paymentMethod;
  final String schedulePickUpTime;

  const TransactionDetailCard({
    super.key,
    required this.transactionId,
    required this.date,
    required this.time,
    required this.productName,
    required this.productOptions,
    required this.quantity,
    required this.price,
    required this.voucher,
    required this.total,
    required this.paymentMethod,
    required this.schedulePickUpTime,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 327.w,
            margin: EdgeInsets.only(top: 40.h),
            padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Thank you!",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF323232),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Your transaction was successful",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                _buildRow("ID Transaction", transactionId),
                SizedBox(height: 8.h),
                _buildRow("Date", date),
                SizedBox(height: 8.h),
                _buildRow("Time", time),
                SizedBox(height: 16.h),
                Divider(color: const Color(0xFFF4F4F4), thickness: 1.h),
                SizedBox(height: 16.h),
                Text(
                  "Item",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF323232),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF323232),
                                ),
                              ),
                              Text(
                                "x$quantity",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF323232),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            productOptions,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  "Payment Summary",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF323232),
                  ),
                ),
                SizedBox(height: 8.h),
                _buildRow("Price", "Rp${price.toStringAsFixed(0)}"),
                SizedBox(height: 4.h),
                _buildRow("Voucher",
                    voucher == 0 ? "0" : "-Rp${voucher.toStringAsFixed(0)}"),
                SizedBox(height: 4.h),
                _buildRow("Total", "Rp${total.toStringAsFixed(0)}",
                    isBold: true),
                SizedBox(height: 16.h),
                _buildRow("Payment Method", paymentMethod),
                SizedBox(height: 16.h),
                _buildRow("Schedule Pick Up", schedulePickUpTime),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: const BoxDecoration(
                color: Color(0xFFE5F9EF),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF459E6D),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 32.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: isBold ? const Color(0xFF323232) : Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: const Color(0xFF323232),
          ),
        ),
      ],
    );
  }
}
