class ProductItemsModel {
  final String productLabel;
  final String productDescription;
  final String productImage;
  final double productPrice;
  final double? productOriginalPrice;

  ProductItemsModel({
    required this.productImage,
    required this.productLabel,
    required this.productDescription,
    required this.productPrice,
    this.productOriginalPrice,
  });
}
