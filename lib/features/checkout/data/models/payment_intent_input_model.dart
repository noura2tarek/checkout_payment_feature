class PaymentIntentInputModel {
  final int? amount;
  final String? currency;
  // add customer id to send it to create payment intent and  save customer info
  final String? customerId;

  PaymentIntentInputModel({
    this.customerId,
    this.amount,
    this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': '${amount}00', // multiply by 100 because paypal divide by 10
      'currency': currency,
      'customer': customerId
    };
  }
}
