import 'package:coffee_shop/constants/app_colors.dart';
import 'package:coffee_shop/model/product_items_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/notes_section.dart';
import 'package:coffee_shop/product/product_customize_card.dart';
import 'package:coffee_shop/product/product_description_card.dart';
import 'package:coffee_shop/product/product_screen_toppings.dart';
import 'package:coffee_shop/product/total_amount_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final ProductItemsModel product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _quantity = 1;
  double _toppingsPrice = 0;

  void _updateQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
    });
  }

  void _updateToppingsPrice(double price) {
    setState(() {
      _toppingsPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: Text(
          "Customize order",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textColorHeading,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/images/home/products/product.png"),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 330),
                            child: ProductDescriptionCard(
                              onQuantityChanged: _updateQuantity,
                              product: widget.product,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    ProductCustomizeCard(),
                    SizedBox(height: 8.h),
                    ProductScreenToppings(
                      onToppingsTotalChanged: _updateToppingsPrice,
                    ),
                    SizedBox(height: 8.h),
                    NotesSection(),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
            TotalAmountTile(
              price: (widget.product.productPrice + _toppingsPrice) * _quantity,
              onAddOrder: () {
                double total =
                    (widget.product.productPrice + _toppingsPrice) * _quantity;
                Navigator.pop(context, total);
              },
            ),
          ],
        ),
      ),
    );
  }
}
