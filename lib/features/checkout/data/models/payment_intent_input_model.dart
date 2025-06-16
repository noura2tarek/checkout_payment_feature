class PaymentIntentInputModel {
  final int? amount;
  final String? currency;

  PaymentIntentInputModel({
    this.amount,
    this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': '${amount}00', // multiply by 100 because paypal divide by 10
      'currency': currency,
    };
  }
}