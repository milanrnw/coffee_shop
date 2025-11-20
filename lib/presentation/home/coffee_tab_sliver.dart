import 'package:coffee_shop/model/pills_model.dart';
import 'package:coffee_shop/model/product_items_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/pills.dart';
import 'package:coffee_shop/presentation/custom_widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeTabSliver extends StatefulWidget {
  const CoffeeTabSliver({super.key,this.controller});

   final ScrollController? controller;

  @override
  State<CoffeeTabSliver> createState() => _CoffeeTabSliverState();
}

final productItemData = [
  ProductItemsModel(
      productImage: "assets/images/home/products/item_1.png",
      productLabel: "Coffee Milk",
      productDescription: "ice americano + fresh milk",
      productPrice: 25.000,
      productRatings: 4.9),
      
  ProductItemsModel(
      productImage: "assets/images/home/products/item_2.png",
      productLabel: "Cocoa Caramel Latte",
      productDescription: "streamed milk with mocha and caramel sauces",
      productPrice: 35.500,
      productRatings: 4.6),
      
  ProductItemsModel(
      productImage: "assets/images/home/products/item_3.png",
      productLabel: "Nitro Cold Brew",
      productDescription:
          "cold brew with nitrogen without sugar, velvety crema.",
      productPrice: 31.000,
      productRatings: 4.4),

  ProductItemsModel(
      productImage: "assets/images/home/products/item_4.png",
      productLabel: "Caffe Mocha",
      productDescription:
          "Espresso with mocha sause, milk and whipped cream",
      productPrice: 29.000,
      productRatings: 4.7),

  ProductItemsModel(
      productImage: "assets/images/home/products/item_3.png",
      productLabel: "Nitro Cold Brew",
      productDescription:
          "cold brew with nitrogen without sugar, velvety crema.",
      productPrice: 31.000,
      productRatings: 4.4),

  ProductItemsModel(
      productImage: "assets/images/home/products/item_4.png",
      productLabel: "Caffe Mocha",
      productDescription:
          "Espresso with mocha sause, milk and whipped cream",
      productPrice: 29.000,
      productRatings: 4.7),

      ProductItemsModel(
      productImage: "assets/images/home/products/item_1.png",
      productLabel: "Coffee Milk",
      productDescription: "ice americano + fresh milk",
      productPrice: 25.000,
      productRatings: 4.9),
      
  ProductItemsModel(
      productImage: "assets/images/home/products/item_2.png",
      productLabel: "Cocoa Caramel Latte",
      productDescription: "streamed milk with mocha and caramel sauces",
      productPrice: 35.500,
      productRatings: 4.6),
      
  ProductItemsModel(
      productImage: "assets/images/home/products/item_3.png",
      productLabel: "Nitro Cold Brew",
      productDescription:
          "cold brew with nitrogen without sugar, velvety crema.",
      productPrice: 31.000,
      productRatings: 4.4),

  ProductItemsModel(
      productImage: "assets/images/home/products/item_4.png",
      productLabel: "Caffe Mocha",
      productDescription:
          "Espresso with mocha sause, milk and whipped cream",
      productPrice: 29.000,
      productRatings: 4.7),

  ProductItemsModel(
      productImage: "assets/images/home/products/item_3.png",
      productLabel: "Nitro Cold Brew",
      productDescription:
          "cold brew with nitrogen without sugar, velvety crema.",
      productPrice: 31.000,
      productRatings: 4.4),

  ProductItemsModel(
      productImage: "assets/images/home/products/item_4.png",
      productLabel: "Caffe Mocha",
      productDescription:
          "Espresso with mocha sause, milk and whipped cream",
      productPrice: 29.000,
      productRatings: 4.7),      
];

List<PillsModel> pillsList = [
  PillsModel(icon: Icons.filter, text: 'Filter'),
  PillsModel(icon: Icons.star, text: 'Rating 4.5+'),
  PillsModel(icon: Icons.price_check_rounded, text: 'Price'),
  PillsModel(icon: Icons.discount, text: 'Promo'),
  PillsModel(icon: Icons.food_bank, text: 'PureVeg'),
  PillsModel(icon: Icons.new_label, text: 'New'),
];

class _CoffeeTabSliverState extends State<CoffeeTabSliver> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      child: Column(
        children: [
          SizedBox(height: 8.h),
          SizedBox(
            height: 42.h,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: pillsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Pills(onTap: () {
                pillsList[index].isSelected = !pillsList[index].isSelected;
              setState(() {});
              },
              pillData: pillsList[index],
              ),
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ProductTile(
                  productRatings: productItemData[index].productRatings,
                  productlabel: productItemData[index].productLabel,
                  productDescription: productItemData[index].productDescription,
                  productImage: productItemData[index].productImage,
                  originalPrice: productItemData[index].productPrice, // dynamic price not showing
              ),
              itemCount: productItemData.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}