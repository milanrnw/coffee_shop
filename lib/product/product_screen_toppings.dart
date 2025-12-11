import 'package:coffee_shop/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreenToppings extends StatefulWidget {
  const ProductScreenToppings(
      {super.key, required this.onToppingsTotalChanged});

  final Function(double) onToppingsTotalChanged;

  @override
  State<ProductScreenToppings> createState() => _ProductScreenToppingsState();
}

class _ProductScreenToppingsState extends State<ProductScreenToppings> {
  final List<Map<String, dynamic>> toppings = [
    {"name": "Extra Espresso", "price": 5.000},
    {"name": "Cincau", "price": 6.000},
    {"name": "Coffee Jelly", "price": 3.000},
    {"name": "Chocolate Ice Cream", "price": 7.000},
  ];

  List<bool> toppingsValues = List.filled(4, false);

  void _updateTotal() {
    double total = 0;
    for (int i = 0; i < toppings.length; i++) {
      if (toppingsValues[i]) {
        total += toppings[i]['price'];
      }
    }
    widget.onToppingsTotalChanged(total);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 0.9.sw,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Topping',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColorHeading,
              ),
            ),
            SizedBox(height: 8.h),
            for (int i = 0; i < toppings.length; i++) ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        toppings[i]['name'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textColorHeading,
                        ),
                      ),
                    ),
                    Text(
                      '+ Rp. ${(toppings[i]['price'] as double).toStringAsFixed(3)}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textColorHeading,
                      ),
                    ),
                    Checkbox(
                      activeColor: AppColors.brandColor,
                      value: toppingsValues[i],
                      onChanged: (value) {
                        setState(() {
                          toppingsValues[i] = value!;
                          _updateTotal();
                        });
                      },
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
              if (i != toppings.length - 1) SizedBox(height: 0),
            ]
          ],
        ),
      ),
    );
  }
}
