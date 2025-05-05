class ProductItemsModel {
  final String productLabel;
  final String productDescription;
  final String productImage;
  final double productPrice;
  final double? productOriginalPrice;
  final double productRatings;

  ProductItemsModel({
    required this.productImage,
    required this.productLabel,
    required this.productDescription,
    required this.productPrice,
    this.productOriginalPrice,
    required this.productRatings,
  });
}
