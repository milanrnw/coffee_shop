import 'package:coffee_shop/constants/app_text_styles.dart';
import 'package:coffee_shop/presentation/custom_widgets/product_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    super.key,
    this.originalPrice = 0,
    required this.productlabel,
    required this.productDescription,
    required this.productImage,
    required this.productRatings,
  });

  final double? originalPrice;
  final String productDescription;
  final String productlabel;
  final String productImage;
  final double productRatings;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isTwoLines = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 69.h,
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
                    height: 69.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          widget.productImage,
                        ),
                      ),
                      shape: BoxShape.circle,
                      color: Color(0XFFF4F4F4),
                    ),
                  ),
                  ProductRating(rating: widget.productRatings),
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productlabel,
                      style: AppTextStyles.productLabelText,
                    ),
                    SizedBox(height: 8.h),
                    Flexible(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final span = TextSpan(
                            text: widget.productDescription,
                            style: AppTextStyles.productDescriptionText,
                          );

                          final tp = TextPainter(
                            text: span,
                            maxLines: 2,
                            textDirection: TextDirection.ltr,
                          );

                          tp.layout(maxWidth: constraints.maxWidth - 10);
                          final numLines = tp.computeLineMetrics().length;

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
                            style: AppTextStyles.productDescriptionText,
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
                Text('Rp ${(widget.originalPrice ?? 0).toStringAsFixed(3)}',
                    style: AppTextStyles.salePrice),
                SizedBox(height: widget.originalPrice != null ? 8 : 4),
                isTwoLines
                    ? Text(
                        widget.originalPrice != null ? 'Rp 25.000' : '\n',
                        maxLines: 2,
                        style: AppTextStyles.originalPrice,
                      )
                    : const SizedBox(),
                !isTwoLines
                    ? Text(
                        widget.originalPrice != null ? 'Rp 25.000' : '',
                        maxLines: 2,
                        style: AppTextStyles.originalPrice,
                      )
                    : const SizedBox(),
              ])
        ],
      ),
    );
  }
}
