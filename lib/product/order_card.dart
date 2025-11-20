import 'package:coffee_shop/presentation/custom_widgets/quantity_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.onQuantityChanged,
    required this.quantity, // <--- Added this parameter
  });

  final Function(int) onQuantityChanged;
  final int quantity; // <--- Added this variable

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.h,
      width: 375.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 70.w,
                    width: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0XFFF4F4F4),
                    ),
                  ),
                  Positioned(
                    bottom: -4.w,
                    child: Image.asset(
                      "assets/images/home/products/product_image.png",
                      width: 85.w,
                      height: 85.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Coffee milk",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          "Rp. 25.000",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Ice, Regular, Normal Sugar, Normal Ice",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "x$quantity", // <--- Updated to show dynamic quantity
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.edit_outlined,
                                color: Colors.black54, size: 20.sp),
                            SizedBox(width: 4.w),
                            Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Controls
                        Icon(Icons.delete_outline,
                            color: Colors.black54, size: 24.sp),
                        SizedBox(width: 8.w),
                        QuantityAdjust(
                          quantity: quantity, // <--- Passing the quantity here
                          onQuantityChanged: onQuantityChanged,
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 14.sp,
                  color: const Color(0xFF5D4037),
                ),
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
        ],
      ),
    );
  }
}
