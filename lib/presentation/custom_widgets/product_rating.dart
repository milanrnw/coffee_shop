import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key,
  required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),

      child: Row(
        children: [
          Icon(
            Icons.star_rate_rounded,
            color: Color(0XFFFFB800),
            size: 14.r,
          ),
          SizedBox(width: 2),
          Text(
            rating.toString(),
            style: AppTextStyles.productRatingText,
          )
        ],
      ),
    );
  }
}
