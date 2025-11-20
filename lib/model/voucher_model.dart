class VoucherModel {
  final int id;
  final String title;
  final String subtitle;
  final String? warning;
  final String imagePath;
  final double discountAmount;
  final bool isPercentage;

  VoucherModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.discountAmount,
    required this.isPercentage,
    this.warning,
  });
}
