import 'package:coffee_shop/model/pills_model.dart';
import 'package:coffee_shop/model/product_items_model.dart';
import 'package:coffee_shop/presentation/custom_widgets/pills.dart';
import 'package:coffee_shop/presentation/custom_widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeTab extends StatefulWidget {
  const CoffeeTab({super.key});

  @override
  State<CoffeeTab> createState() => _CoffeeTabState();
}

final productItemData = [
  ProductItemsModel(
      productImage: "assets/images/home/products/item_1.png",
      productLabel: "Coffee Milk",
      productDescription: "ice americano + fresh milk",
      productPrice: 25.000),
  ProductItemsModel(
      productImage: "assets/images/home/products/item_2.png",
      productLabel: "Cocoa Caramel Latte",
      productDescription: "streamed milk with mocha and caramel sauces",
      productPrice: 35.500),
  ProductItemsModel(
      productImage: "assets/images/home/products/item_1.png",
      productLabel: "Nitro Cold Brew",
      productDescription:
          "cold brew with nitrogen without sugar, velvety crema.",
      productPrice: 31.000),
];

List<PillsModel> pillsList = [
  PillsModel(icon: Icons.filter, text: 'Filter'),
  PillsModel(icon: Icons.star, text: 'Rating 4.5+'),
  PillsModel(icon: Icons.price_check_rounded, text: 'Price'),
  PillsModel(icon: Icons.discount, text: 'Promo'),
];

class _CoffeeTabState extends State<CoffeeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        ListView.builder(
          itemBuilder: (context, index) => ProductTile(
              productlabel: productItemData[index].productLabel,
              productDescription: productItemData[index].productDescription,
              productImage: productItemData[index].productImage,
              originalPrice: productItemData[index].productOriginalPrice),
          itemCount: productItemData.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
