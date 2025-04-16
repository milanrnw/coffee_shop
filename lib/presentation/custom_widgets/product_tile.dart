import 'package:coffee_shop/presentation/custom_widgets/product_rating.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  const ProductTile(
      {super.key, this.originalPrice, required this.productDescription});

  final double? originalPrice;
  final String productDescription;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isTwoLines = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.10,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: screenHeight * 0.081,
                    width: screenWidth * 0.176,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/home/products/item_1.png'),
                      ),
                      shape: BoxShape.circle,
                      color: Color(0XFFF4F4F4),
                    ),
                  ),
                  ProductRating(rating: 4.9),
                ],
              ),
              SizedBox(
                width: screenWidth * 0.021,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coffee Milk',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF555555),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Flexible(
                      child: LayoutBuilder(
                        builder: (context, constraints) //check
                            {
                          final span = TextSpan(
                            text: widget.productDescription,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0XFF555555),
                            ),
                          );

                          final tp = TextPainter(
                            text: span,
                            maxLines: 2,
                            textDirection: TextDirection.ltr,
                          );

                          tp.layout(maxWidth: constraints.maxWidth - 10);
                          final numLines = tp.computeLineMetrics().length;

                          // Update once only if changed
                          if (numLines != (isTwoLines ? 2 : 1)) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                isTwoLines = numLines > 1;
                              });
                            });
                          }

                          return Text(
                            widget.productDescription,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0XFF555555),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rp 25.000',
               style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff555555),
                ),
              ),
              
              SizedBox(height: widget.originalPrice != null ? 8 : 4),
              isTwoLines ? Text(
                widget.originalPrice != null ? 'Rp 25.000' : '\n',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF555555),
                ),
              )

              : const SizedBox(),
              !isTwoLines ? Text(
                widget.originalPrice != null ? 'Rp 25.000' : '',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF555555),
                ),
              )

              : const SizedBox(),
            ]
          )
        ],
      ),
    );
  }
}
