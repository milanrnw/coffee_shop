import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Icon(
            Icons.star_rate_rounded,
            color: Color(0XFFFFB800),
            size: 14,
          ),
          SizedBox(width: 2,),
          Text(
            rating.toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0XFF3C3C3C),
            ),
          )
        ],
      ),
    );
  }
}
