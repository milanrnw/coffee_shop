import 'package:coffee_shop/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuantityAdjust extends StatefulWidget {
  const QuantityAdjust({
    super.key,
    required this.quantity,
    required this.onQuantityChanged, // Add this parameter
  });

  final int quantity;
  final Function(int) onQuantityChanged; // Callback function

  @override
  State<QuantityAdjust> createState() => _QuantityAdjustState();
}

class _QuantityAdjustState extends State<QuantityAdjust> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

  void _increment() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged(_quantity); // Pass updated quantity to parent
  }

  void _decrement() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
    widget.onQuantityChanged(_quantity); // Pass updated quantity to parent
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          Container(
            height: 28.h,
            width: 75.w,
            decoration: BoxDecoration(
                color: AppColors.brandColor,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _decrement, // Handle decrement action
                  child: SvgPicture.asset(
                    "assets/icons/minus-svgrepo-com.svg",
                    height: 16.r,
                    width: 16.r,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
                Container(
                  height: 25.h,
                  width: 25.w,
                  color: Colors.white,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        "$_quantity", // Display the updated quantity
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _increment, // Handle increment action
                  child: SvgPicture.asset(
                    "assets/icons/plus-large-svgrepo-com.svg",
                    height: 16.r,
                    width: 16.r,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
