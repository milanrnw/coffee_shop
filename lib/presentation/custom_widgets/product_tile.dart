import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligning items to the top of the row
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: screenHeight * 0.0812,
                width: screenWidth * 0.176,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home/products/item_1.png'),
                  ),
                  shape: BoxShape.circle,
                  color: Color(0XFF56483C).withValues(alpha: .05),
                ),
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.021),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Coffee Milk',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF555555)),
              ),
              Text(
                'ice americano + fresh milk',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFF555555)),
              ),
            ],
          ),
          Spacer(),
          Text(
            'Rp. 25.000',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0XFF555555)),
          ),
        ],
      ),
    );
  }
}
