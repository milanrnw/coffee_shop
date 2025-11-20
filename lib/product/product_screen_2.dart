import 'package:coffee_shop/product/product_customize_card_2.dart';
import 'package:coffee_shop/product/product_description_card_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen2 extends StatefulWidget {
  const ProductScreen2({super.key});

  @override
  State<ProductScreen2> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen2> {
  int _quantity = 1;  // Track the quantity state

  void _updateQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/home/products/product.png"),
                ),
                Positioned(
                  top: 300.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ProductDescriptionCard2(),
                  ),
                ),
                Positioned(
                  top: 450.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ProductCustomizeCard2(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
