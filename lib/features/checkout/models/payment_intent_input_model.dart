class PaymentIntentInputModel {
  final String? amount;
  final String? currency;

  PaymentIntentInputModel({
    this.amount,
    this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}