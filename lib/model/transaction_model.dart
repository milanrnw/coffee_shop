class TransactionModel {
  final String transactionId;
  final String date;
  final String time;
  final String productName;
  final String productOptions;
  final String? productImage;
  final int quantity;
  final double price;
  final double voucher;
  final double total;
  final String paymentMethod;
  final String schedulePickUpTime;

  TransactionModel({
    required this.transactionId,
    required this.date,
    required this.time,
    required this.productName,
    required this.productOptions,
    this.productImage,
    required this.quantity,
    required this.price,
    required this.voucher,
    required this.total,
    required this.paymentMethod,
    required this.schedulePickUpTime,
  });
}