import 'package:coffee_shop/model/voucher_model.dart';

final List<VoucherModel> voucherList = [
  VoucherModel(
    id: 1,
    title: "Disc 10% up to Rp20.000",
    subtitle: "No minimum purchase",
    imagePath: "assets/images/voucher/voucher.png",
    discountAmount: 10, // 10%
    isPercentage: true,
  ),
  VoucherModel(
    id: 2,
    title: "Disc 15% up to Rp25.000",
    subtitle: "Minimum spend Rp20.000",
    imagePath: "assets/images/voucher/voucher.png",
    discountAmount: 15, // 15%
    isPercentage: true,
  ),
  VoucherModel(
    id: 3,
    title: "Disc Rp75.000",
    subtitle: "Minimum spend Rp280.000",
    warning: "Spend another Rp100,000 to enjoy this voucher",
    imagePath: "assets/images/voucher/voucher_unavailable1.png",
    discountAmount: 75000,
    isPercentage: false,
  ),
  VoucherModel(
    id: 4,
    title: "Disc Rp20.000",
    subtitle: "Minimum spend Rp80.000",
    warning: "Spend another Rp60,000 to enjoy this voucher",
    imagePath: "assets/images/voucher/voucher_unavailable2.png",
    discountAmount: 20000,
    isPercentage: false,
  ),
];
